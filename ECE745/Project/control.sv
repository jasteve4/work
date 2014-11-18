`define ADD 4'b0001
`define AND 4'b0101
`define NOT 4'b1001
`define LD 4'b0010
`define LDR 4'b0110
`define LDI 4'b1010
`define LEA 4'b1110
`define ST 4'b0011
`define STR 4'b0111
`define STI 4'b1011
`define BR 4'b0000
`define JMP 4'b1100

logic CON_bypass_alu_1, CON_bypass_alu_2, CON_bypass_mem_1, CON_bypass_mem_2;
logic CON_en_updatePC = 0, CON_en_fetch = 0, CON_en_decode = 0, CON_en_execute = 0, CON_en_mem = 0, CON_en_WB = 0;	//All our outputs.
logic [1:0] CON_mem_state;
logic [1:0] CON_stall, fetch_stall;
logic [1:0]			lastIR_ST = 0;
logic		x = 0,	CON_br_taken;
logic [2:0] CON_counter;

task control ();

	if(dut_io.reset)
	begin
		CON_en_updatePC = 1;
		CON_en_fetch = 1;
		CON_en_decode = 0;
		CON_en_execute= 0;	
		CON_en_mem = 0;	
		CON_en_WB = 0;	
		CON_br_taken = 0;
		CON_mem_state = 3;
		CON_counter = 2;
		CON_stall = 0;
		lastIR_ST = 0;
		fetch_stall = 0;
		CON_bypass_alu_1 = 1'b0;			
		CON_bypass_alu_2 = 1'b0;			
		CON_bypass_mem_1 = 1'b0;			
		CON_bypass_mem_2 = 1'b0;			
	end

	else
	begin

		CON_bypass_alu_1 = 1'b0;			
		CON_bypass_alu_2 = 1'b0;			
		CON_bypass_mem_1 = 1'b0;			
		CON_bypass_mem_2 = 1'b0;			
		CON_br_taken = 0;

		if (CON_stall)
		begin
			CON_stall--;

			if(CON_stall == 1)
			begin
				CON_en_fetch	= 1;
				CON_en_updatePC	= 1;
				CON_en_decode = 1;
				CON_en_execute = 1;	
				CON_en_mem = 1;	
				CON_en_WB= 1;
			end

			if (lastIR_ST == 3) 
			begin
				CON_en_WB = 0;
				lastIR_ST= 2;
			end
			else if(lastIR_ST == 2)
			begin
				CON_en_WB = 0;
				lastIR_ST = 1;
			end
			else if(lastIR_ST == 1)
			begin
				CON_en_WB = 1;
				lastIR_ST= 0;
			end
		end

		else
		begin

			if(!(fetch_stall))
			begin
			//	CON_en_fetch = 1;
				CON_en_updatePC = 1;
			end
			else
				fetch_stall--;

				// propigate enables throught pipeline
			CON_en_WB = CON_en_execute ;

			CON_en_execute = CON_en_decode;
				if (~CON_en_execute) CON_en_WB = 0;
			CON_en_decode = CON_en_fetch;

			//CON_en_fetch = (CON_counter == 0);
			if (CON_counter == 2) CON_en_fetch = 1;
			if (CON_counter > 0)
					CON_counter--;
		end

		//Arithmetic on Arithmetic Dependencies, and Arithmetic on Load Dependencies. Bypass Computations.
		//Arithmetic in Decode. Load in Exec.

		if((dut_io.control_IR[15:12]==`ADD) || (dut_io.control_IR[15:12]==`AND) || (dut_io.control_IR[15:12]==`NOT))
		begin
			if((dut_io.control_IR_Exec[15:12]==`ADD) || (dut_io.control_IR_Exec[15:12]==`AND) || (dut_io.control_IR_Exec[15:12]==`NOT) || (dut_io.control_IR_Exec[15:12]==`LEA))
			begin
				if(dut_io.control_IR_Exec[11:9] == dut_io.control_IR[8:6])
					CON_bypass_alu_1 = 1'b1;			

				if(!(dut_io.control_IR[5]))
				begin
					if(dut_io.control_IR_Exec[11:9] == dut_io.control_IR[2:0])
						CON_bypass_alu_2 = 1'b1;
				end	
				
			end		
			
			if((dut_io.control_IR_Exec[15:12]==`LD) || (dut_io.control_IR_Exec[15:12]==`LDI) || (dut_io.control_IR_Exec[15:12]==`LDR))
			begin
				if(dut_io.control_IR_Exec[11:9] == dut_io.control_IR[8:6])
					CON_bypass_mem_1 = 1'b1;			
			
				if(!(dut_io.control_IR[5]))
				begin
					if(dut_io.control_IR_Exec[11:9] == dut_io.control_IR[2:0])
						CON_bypass_mem_2 = 1'b1;
				end
			end
			
		end

		//Load(LDR) on Arithmetic Dependencies. Bypass Computations.
		//LDR in Decode. Arithmetic in Exec.
			
	if((dut_io.control_IR[15:12]==`LDR))
		begin
			if((dut_io.control_IR_Exec[15:12]==`ADD) || (dut_io.control_IR_Exec[15:12]==`AND) || (dut_io.control_IR_Exec[15:12]==`NOT) || (dut_io.control_IR_Exec[15:12]==`LEA))
			begin
				if(dut_io.control_IR_Exec[11:9] == dut_io.control_IR[8:6])
					CON_bypass_alu_1 = 1'b1;			
			end

		end

		//Store(STR) on Arithmetic Dependencies. Bypass Computations.
		//STR in Decode. Arithmetic in Exec.
			
		if((dut_io.control_IR[15:12]==`STR))
		begin
			if((dut_io.control_IR_Exec[15:12]==`ADD) || (dut_io.control_IR_Exec[15:12]==`AND) || (dut_io.control_IR_Exec[15:12]==`NOT) || (dut_io.control_IR_Exec[15:12]==`LEA))
			begin
				if(dut_io.control_IR_Exec[11:9] == dut_io.control_IR[8:6])
					CON_bypass_alu_1 = 1'b1;			
	
				if(dut_io.control_IR_Exec[11:9] == dut_io.control_IR[11:9])
					CON_bypass_alu_2 = 1'b1;		
			end

		end
	
		//Store(ST/STI) on Arithmetic Dependencies. Bypass Computations.
		//ST/STI in Decode. Arithmetic in Exec.

		if((dut_io.control_IR[15:12]==`STI) || (dut_io.control_IR[15:12]==`ST))
		begin
			if((dut_io.control_IR_Exec[15:12]==`ADD) || (dut_io.control_IR_Exec[15:12]==`AND) || (dut_io.control_IR_Exec[15:12]==`NOT) || (dut_io.control_IR_Exec[15:12]==`LEA))
			begin
				if(dut_io.control_IR_Exec[11:9] == dut_io.control_IR[11:9])
					CON_bypass_alu_2 = 1'b1;		
			
			end
		end
	
		//JUMP on Arithmetic Dependencies. Bypass Computations.
		//JUMP in Decode. Arithmetic in Exec.
		
		if((dut_io.control_IR[15:12]==`JMP))
		begin
			if((dut_io.control_IR_Exec[15:12]==`ADD) || (dut_io.control_IR_Exec[15:12]==`AND) || (dut_io.control_IR_Exec[15:12]==`NOT) || (dut_io.control_IR_Exec[15:12]==`LEA))
			begin
				if(dut_io.control_IR_Exec[11:9] == dut_io.control_IR[8:6])
					CON_bypass_alu_1 = 1'b1;			
				
			end
		end			

	
	 	////////// MEM_STATE LOGIC HERE! //////////////////////	

		case (CON_mem_state)
			3: begin
					if((dut_io.control_IR_Exec[15:12]==`LD) || (dut_io.control_IR_Exec[15:12]==`LDR))
						CON_mem_state = 0;	

					if((dut_io.control_IR_Exec[15:12]==`ST) || (dut_io.control_IR_Exec[15:12]==`STR))
						CON_mem_state = 2;

					if((dut_io.control_IR_Exec[15:12]==`STI) || (dut_io.control_IR_Exec[15:12]==`LDI))
						CON_mem_state = 1;	
				end

			2: CON_mem_state = 3;

			1: begin
					if((dut_io.control_IR_Exec[15:12]==`LD) || (dut_io.control_IR_Exec[15:12]==`LDR) || (dut_io.control_IR_Exec[15:12]==`LDI))
						CON_mem_state = 0;

					if((dut_io.control_IR_Exec[15:12]==`ST) || (dut_io.control_IR_Exec[15:12]==`STR) || (dut_io.control_IR_Exec[15:12]==`STI))
						CON_mem_state = 2;
					
		 	   end

			0: CON_mem_state = 3;
		endcase


		////////// ENABLE LOGIC BEGINS HERE! //////////////////
		//////////logic CON_en_updatePC, CON_en_fetch, CON_en_decode, CON_en_execute, CON_en_WB;
			
		if (!CON_stall)
		begin

			if((dut_io.control_IR_Exec[15:12]==`LD) || (dut_io.control_IR_Exec[15:12]==`LDR))
			begin
				CON_stall = 2;
				CON_en_updatePC = 0;
				CON_en_fetch	= 0;
				CON_en_decode	= 0;
				CON_en_execute	= 0;
				CON_en_WB	= 0;
			end
			if((dut_io.control_IR_Exec[15:12]==`ST) || (dut_io.control_IR_Exec[15:12]==`STR))
			begin
				CON_stall = 2;
				CON_en_updatePC = 0;
				CON_en_fetch	= 0;
				CON_en_decode	= 0;
				CON_en_execute	= 0;
				CON_en_WB	= 0;
			end

			if((dut_io.control_IR_Exec[15:12]==`LDI)|| (dut_io.control_IR_Exec[15:12]==`STI))
			begin
				CON_stall = 3;
				CON_en_updatePC = 0;
				CON_en_fetch	= 0;
				CON_en_decode	= 0;
				CON_en_execute	= 0;
				CON_en_WB	= 0;
			end
		

			if(!lastIR_ST)
			begin
				if((dut_io.control_IR_Exec[15:12]==`ST) || (dut_io.control_IR_Exec[15:12]==`STR)) 
					lastIR_ST = 2;
				else if((dut_io.control_IR_Exec[15:12]==`STI)) 
				begin
					lastIR_ST = 3;
					x = 1;
				end
			end
		end

		////////////BRANCH TAKEN////////////

		CON_br_taken = | (dut_io.control_NZP & dut_io.control_psr);
		if (CON_br_taken) CON_en_updatePC = 1;
				
		if (!CON_counter)
		begin
		#1;
			if((top_io.cb.Instr_dout[15:12]==`BR) || (top_io.cb.Instr_dout[15:12]==`JMP))
			begin
				CON_en_updatePC = 0;
				CON_en_fetch	= 0;
				fetch_stall	= 2;
				CON_counter 	= 4;
			end
		end
	

	end

	#1;	
		if(CON_bypass_alu_1 !== dut_io.control_bypass_alu_1)
			$display($time, " Control signal error : ALU bypass 1 incorrect "); 
		
		if(CON_bypass_alu_2 !== dut_io.control_bypass_alu_2)
			$display($time, " Control signal error : ALU bypass 2 incorrect "); 
		
		if(CON_bypass_mem_1 !== dut_io.control_bypass_mem_1)
			$display($time, " Control signal error : MEM bypass 1 incorrect "); 

		if(CON_bypass_mem_2 !== dut_io.control_bypass_mem_2)
			$display($time, " Control signal error : MEM bypass 2 incorrect "); 
		
		if(CON_mem_state !== dut_io.control_mem_state)
			$display($time, " Control signal error : MEM STATE incorrect "); 
		
		if(CON_en_fetch !== dut_io.control_enable_fetch)
			$display($time, " Control signal error : Enable Fetch incorrect "); 
	
		if(CON_en_decode !== dut_io.control_enable_decode)
			$display($time, " Control signal error : Enable Decode incorrect "); 
	
		if(CON_en_execute !== dut_io.control_enable_execute)
			$display($time, " Control signal error : Enable Execute incorrect "); 
	
		if(CON_en_WB !== dut_io.control_enable_writeback)
			$display($time, " Control signal error : Enable Writeback incorrect "); 
	
	  	if(CON_en_updatePC !== dut_io.control_enable_updatePC)
	  		$display($time, " Control signal error : Enable UpdatePC incorrect "); 
	
 	 	if(CON_br_taken !== dut_io.control_br_taken)
	  		$display($time, " Control signal error : Branch Taken incorrect "); 

endtask
