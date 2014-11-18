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

logic [15:0] proc_instr_dout;
logic [15:0] proc_npc_in;
logic 		 proc_enable_decode, proc_reset;
logic [15:0] DEC_IR;
logic [15:0] DEC_npc_out;
logic [5:0]  DEC_E_Control;
logic [1:0]  DEC_W_Control;
logic 		 DEC_Mem_Control;

task decode ();
   
	if (dut_io.reset)
	begin
		DEC_IR = 0;
		DEC_npc_out = 0;
		DEC_E_Control = 0;
		DEC_W_Control = 0;
		DEC_Mem_Control = 0;
	end

	else
	begin
   	 
	  if(proc_enable_decode)
	  begin
		DEC_IR = dut_io.dec_instr_dout;

		DEC_npc_out = proc_npc_in;

		casex (dut_io.dec_instr_dout[15:12])		//W_Control computation

			4'bxxx1:
				DEC_W_Control = 0;	//Arithmetic, Stores
			4'b0x10:
				DEC_W_Control = 1;	//LD, LDR, LDI
			4'b1010:
				DEC_W_Control = 1;	// LDI
			4'b1110:
				DEC_W_Control = 2;	//LEA
			4'bxx00:
				DEC_W_Control = 0;	//BR and JMP
			default:
				DEC_W_Control = 0;	
			
		endcase

		casex (dut_io.dec_instr_dout[15:12])		//E_Control computation
		
			`BR:					//BR	
			begin
				DEC_E_Control[3:2] = 1;
				DEC_E_Control[1] = 1;
				if (DEC_E_Control[3:1] !== dut_io.dec_E_Control[3:1])
					$display ($time, "Decode block error -- E_Control error for BR instruction");
			end

			`ADD:					//ADD
			begin
				DEC_E_Control[5:4] = 0;
				if(dut_io.dec_instr_dout[5])
					DEC_E_Control[0] = 0;
				else
					DEC_E_Control[0] = 1;
				if (DEC_E_Control[5:4] !== dut_io.dec_E_Control[5:4])
					$display ($time, "Decode block error -- E_Control error for ADD instruction, [5:4] wrong");
				if (DEC_E_Control[0] !== dut_io.dec_E_Control[0])
					$display ($time, "Decode block error -- E_Control error for ADD -- last bit wrong");
			end
				
			`LD:					//LD
			begin
				DEC_E_Control[3:2] = 1;
				DEC_E_Control[1] = 1;
				if (DEC_E_Control[3:1] !== dut_io.dec_E_Control[3:1])
					$display ($time, "Decode block error -- E_Control error for LD instruction");
			end

			`ST:					//ST
			begin
				DEC_E_Control[3:2] = 1;
				DEC_E_Control[1] = 1;
				if (DEC_E_Control[3:1] !== dut_io.dec_E_Control[3:1])
					$display ($time, "Decode block error -- E_Control error for ST instruction");
			end
	
			`AND:					//AND
			begin
				DEC_E_Control[5:4] = 1;
				if(dut_io.dec_instr_dout[5])
					DEC_E_Control[0] = 0;
				else
					DEC_E_Control[0] = 1;
				if (DEC_E_Control[5:4] !== dut_io.dec_E_Control[5:4])
					$display ($time, "Decode block error -- E_Control error for AND instruction, [5:4] wrong");
				if (DEC_E_Control[0] !== dut_io.dec_E_Control[0])
					$display ($time, "Decode block error -- E_Control error for AND -- last bit wrong");
			end
				
			`LDR:					//LDR
			begin
				DEC_E_Control[3:2] = 2;
				DEC_E_Control[1] = 0;
				if (DEC_E_Control[3:1] !== dut_io.dec_E_Control[3:1])
					$display ($time, "Decode block error -- E_Control error for LDR");
			end

			`STR:					//STR
			begin
				DEC_E_Control[3:2] = 2;
				DEC_E_Control[1] = 0;
				if (DEC_E_Control[3:1] !== dut_io.dec_E_Control[3:1])
					$display ($time, "Decode block error -- E_Control error for STR");
			end

			`NOT:					//NOT
			begin
				DEC_E_Control[5:4] = 2;
				if (DEC_E_Control[5:4] !== dut_io.dec_E_Control[5:4])
					$display ($time, "Decode block error -- E_Control error for NOT instruction, [5:4] wrong");
			end
	
			`LDI:					//LDI
			begin
				DEC_E_Control[3:2] = 1;
				DEC_E_Control[1] = 1;
				if (DEC_E_Control[3:1] !== dut_io.dec_E_Control[3:1])
					$display ($time, "Decode block error -- E_Control error for LDI");
			end

			`STI:					//STI
			begin
				DEC_E_Control[3:2] = 1;
				DEC_E_Control[1] = 1;
				if (DEC_E_Control[3:1] !== dut_io.dec_E_Control[3:1])
					$display ($time, "Decode block error -- E_Control error for STI");
			end

			`JMP:					//JMP
			begin
				DEC_E_Control[3:2] = 3;
				DEC_E_Control[1] = 0;
				if (DEC_E_Control[3:1] !== dut_io.dec_E_Control[3:1])
					$display ($time, "Decode block error -- E_Control error for JMP");
			end
			
			`LEA:					//LEA
			begin
				DEC_E_Control[3:2] = 1;
				DEC_E_Control[1] = 1;
				if (DEC_E_Control[3:1] !== dut_io.dec_E_Control[3:1])
					$display ($time, "Decode block error -- E_Control error for LEA");
			end
		endcase
		
		casex (dut_io.dec_instr_dout[15:12])		//Mem_Control computation
		
			`LD:					//LD
				DEC_Mem_Control = 0;
			`LDR:					//LDR
				DEC_Mem_Control = 0;
			`LDI:					//LDI
				DEC_Mem_Control = 1;
			`ST:					//ST
				DEC_Mem_Control = 0;
			`STR:					//STR
				DEC_Mem_Control = 0;
			`STI:					//STI
				DEC_Mem_Control = 1;
			default:
				DEC_Mem_Control = 0;		//Should be removed.
		endcase
	  end						
	end					
			
	if (DEC_Mem_Control !== dut_io.dec_Mem_Control)
		$display ($time, "Decode block error -- Mem_Control error");

//	if (DEC_E_Control !== dut_io.dec_E_Control)
//		$display ($time, "Decode block error -- E_Control error");

	if (DEC_W_Control !== dut_io.dec_W_Control)
		$display ($time, "Decode block error -- W_Control error");

	if (DEC_IR !== dut_io.dec_IR)
		$display ($time, "Decode block error -- IR incorrectly passed through decode");

	if (DEC_npc_out !== dut_io.dec_npc_out)
		$display ($time, "Decode block error -- NPC incorrectly passed through");


	proc_npc_in = dut_io.dec_npc_in;
	proc_instr_dout = dut_io.dec_instr_dout;
	proc_enable_decode = dut_io.dec_enable_decode;
	proc_reset = dut_io.reset;

endtask
