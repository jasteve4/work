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

logic [15:0] EX_imm5, EX_offset6, EX_offset9, EX_offset11;
logic [15:0] EX_aluin1, EX_aluin2, EX_aluout, EX_pcout, EX_IR_exec, EX_M_Data;
logic [1:0]	 EX_W_Control_out;
logic [2:0]  EX_sr1, EX_sr2, EX_dr, EX_NZP;			//make sure that sr1 and sr2 are ASYNCH. So NEW inputs are processed, all other i/p are old.
logic 		 EX_Mem_Control_out;
logic [15:0] EX_a, EX_b;		//for pcout calculations

//buffers for input
logic 			myEX_enable_execute, myEX_Mem_Control_in;
logic [1:0]		myEX_W_Control_in;
logic [15:0]	myEX_IR, myEX_Mem_Bypass_Val, myEX_VSR1, myEX_VSR2, myEX_npc_in;
logic			myEX_bypass_alu_1, myEX_bypass_alu_2, myEX_bypass_mem_1, myEX_bypass_mem_2;
logic [5:0]		myEX_E_Control;
//logic			myEX_reset;

task execute ();

  
	if (dut_io.reset)
		begin
			EX_IR_exec =  0;
			EX_W_Control_out = 0;
			EX_Mem_Control_out = 0;
			EX_dr = 3'b0;
			EX_pcout = 16'h0;
			EX_aluout = 16'h0;
			EX_NZP = 0;
			EX_M_Data = 0;
			EX_sr1 = 0;
			EX_sr2 = 0;
		end
	
	else
		begin
			
		//	if (dut_io.ex_enable_execute)
		//	if (myEX_enable_execute)

 
			begin	
				// send the sr1 and sr2 addresses 
				// CHECK SR1 and SR2 asynch. i.e compare the CURRENT INPUT LOGIC with the CURRENT OUTPUT. No need of buffering these signals.
				
						EX_sr1 	=	dut_io.ex_IR[8:6];			// always -- for all instructions. RESET doesn't affect.
																//also, LATEST INPUTS. ASYNCH OP.
																
				if ((dut_io.ex_IR[15:12] === `ADD) || (dut_io.ex_IR[15:12] === `AND) || (dut_io.ex_IR[15:12] === `NOT))
				// ADD or AND or NOT
					begin
						EX_sr2	=	dut_io.ex_IR[2:0];
					end
					
				else if ((dut_io.ex_IR[15:12] === `LD) || (dut_io.ex_IR[15:12] === `LDR) || (dut_io.ex_IR[15:12] === `LDI) || (dut_io.ex_IR[15:12] === `LEA))
				//	All Load instr	
					begin
						EX_sr2	=	3'b0;
					end
				
				else if ((dut_io.ex_IR[15:12] === `ST) || (dut_io.ex_IR[15:12] === `STR) || (dut_io.ex_IR[15:12] === `STI))
				//	All Store instr
					begin
						EX_sr2	=	dut_io.ex_IR[11:9];
					end
					
				else if ((dut_io.ex_IR[15:12] === `BR) || (dut_io.ex_IR[15:12] === `JMP))
				//	CONTROL (branch and JMP)
					begin
						EX_sr2	=	3'b0;
					end
				else
					begin
						//$display ($time, "Error in the generated instruction. IR[15:12] not matching anything in gr");
					end
			end

		
			if (myEX_enable_execute)
			begin
					// passing values (non changing)
					EX_IR_exec = myEX_IR;
					EX_W_Control_out = myEX_W_Control_in;
					EX_Mem_Control_out = myEX_Mem_Control_in;
				
					
				// DR1
				
				if ((myEX_IR[15:12] === `ADD) || (myEX_IR[15:12] === `AND) || (myEX_IR[15:12] === `NOT))
				// ADD or AND or NOT
					begin
						EX_dr 	= 	myEX_IR[11:9];
					end
					
				else if ((myEX_IR[15:12] === `LD) || (myEX_IR[15:12] === `LDR) || (myEX_IR[15:12] === `LDI) || (myEX_IR[15:12] === `LEA))
				//	All Load instr
					begin
						EX_dr 	= 	myEX_IR[11:9];
					end
				
				else if ((myEX_IR[15:12] === `ST) || (myEX_IR[15:12] === `STR) || (myEX_IR[15:12] === `STI))
				//	All Store instr
					begin
						EX_dr 	= 	3'b0;
					end
					
				else if ((myEX_IR[15:12] === `BR) || (myEX_IR[15:12] === `JMP))
				//	CONTROL (branch and JMP)
					begin
						EX_dr 	= 	3'b0;
					end
				else
					begin
						$display ($time, "Error in the generated instruction. IR[15:12] not matching anything in gr");
					end
					
								
				// Imm5 and other offset values
						
					EX_imm5 = {{11{myEX_IR[4]}}, myEX_IR[4:0]};
					EX_offset6 = {{10{myEX_IR[5]}}, myEX_IR[5:0]};
					EX_offset9 = {{7{myEX_IR[8]}}, myEX_IR[8:0]};
					EX_offset11 = {{5{myEX_IR[10]}}, myEX_IR[10:0]};
				
				
				//aluout logic
				
				//EX_aluin1 = (myEX_bypass_alu_1 | myEX_bypass_mem_1)? ((myEX_bypass_alu_1)? EX_aluout: 
				
					if (myEX_bypass_alu_1 === 1'b1)
						begin
						EX_aluin1 = EX_aluout;			//this EX_aluout is from the gr. Should it be taken from DUT? (for better bug finding?)
						end
					else if (myEX_bypass_mem_1 === 1'b1)
						begin
						EX_aluin1 = myEX_Mem_Bypass_Val;
						end
					else
						begin
						EX_aluin1 = myEX_VSR1;			// use latest VSR1 and VSR2
						end
					

				// EX_aluin2 logic
				
					if (myEX_bypass_alu_2 === 1'b1)
						begin
						EX_aluin2 = EX_aluout;			//this EX_aluout is from the gr. Should it be taken from DUT? (for better bug finding?)
						end
					else if (myEX_bypass_mem_2 === 1'b1)
						begin
						EX_aluin2 = myEX_Mem_Bypass_Val;
						end
					else
						begin
						EX_aluin2 = (myEX_IR[5])? EX_imm5 : myEX_VSR2;
						end
					
				// aluout
					
					casex (myEX_E_Control[5:4])
			
						2'h0: EX_aluout = EX_aluin1 + EX_aluin2;
						2'h1: EX_aluout = EX_aluin1 & EX_aluin2;
						2'h2: EX_aluout = ~ EX_aluin1;
						default: $display("Error in E_control");
					endcase
							
				
				
				// pcout logic
				
					casex (myEX_E_Control[3:2])		//pcselect1
				
						2'h0: EX_a = EX_offset11;
						2'h1: EX_a = EX_offset9;
						2'h2: EX_a = EX_offset6;
						2'h3: EX_a = 16'h0;
						default: $display("Error in E_control");
				
					endcase
				
					casex (myEX_E_Control[1])			//pcselect1
				
						2'h0: EX_b = EX_aluin1;				//need value of aluin 1 !!
						2'h1: EX_b = myEX_npc_in - 1;
						default: $display("Error in E_Control");
					
					endcase
				
					
				//		EX_pcout = (EX_a + EX_b) - 1;
					
				//		if ((myEX_IR[15:12] === 4'b0110) || (myEX_IR[15:12] === 4'b0111))		//LDR and STR
				//		EX_pcout = EX_pcout + 1;
						
						
						EX_pcout = (EX_a + EX_b);


				if ((myEX_IR[15:12] === `ADD) || (myEX_IR[15:12] === `AND) || (myEX_IR[15:12] === `NOT))
				// ADD or AND or NOT
				
					 EX_pcout = EX_aluout;
				
				else
				begin
					 EX_aluout = EX_pcout;
				end			
				// NZP logic
				
					casex (myEX_IR[15:12])
			
						4'h0: EX_NZP = myEX_IR[11:9];
						4'hc: EX_NZP = 3'b111;
						default: EX_NZP = 3'b000;
					endcase
				
				// M_Data
				
					EX_M_Data = (myEX_bypass_alu_2) ? EX_aluin2 : myEX_VSR2;
					
					
			end
			
			else
				begin
					EX_NZP = 3'b000;
				end
		
		
		
		end			//END OF ALL THE LOFIC CALCULATIONS FOR THE GOLDEN REF
		
		
					// Assignment and Checking
					//Check
					
					if (EX_W_Control_out !== dut_io.ex_W_Control_out)
						$display ($time, " Execute block error: W_control mismatch");
						
					if (EX_Mem_Control_out !== dut_io.ex_Mem_Control_out)
						$display ($time, " Execute block error: Mem_Control mismatch");
						
					if (EX_aluout !== dut_io.ex_aluout)
						$display ($time, " Execute block error: aluout mismatch");
						
					if (EX_aluout !== dut_io.ex_aluout)
						$display ($time, " Execute block error: aluout mismatch");
						
					if (EX_pcout !== dut_io.ex_pcout)
						$display ($time, " Execute block error: pcout mismatch");
					
					if (EX_dr !== dut_io.ex_dr)
						$display ($time, " Execute block error: DR mismatch");
						
					if (EX_sr1 !== dut_io.ex_sr1)
						$display ($time, " Execute block error: SR1 mismatch");
					
					if (EX_sr2 !== dut_io.ex_sr2)
						$display ($time, " Execute block error: SR2 mismatch");
						
					if (EX_IR_exec !== dut_io.ex_IR_Exec)
						$display ($time, " Execute block error: IR_Exec mismatch .. IR is not being passed correctly");
					
					if (EX_NZP !== dut_io.ex_NZP)
						$display ($time, " Execute block error: NZP mismatch");
						
					if (EX_M_Data !== dut_io.ex_M_Data)
						$display ($time, " Execute block error: M_Data mismatch");
						
					
								            
					           // myEX_enable_execute = dut_io.ex_enable_execute;
					            myEX_Mem_Control_in = dut_io.ex_Mem_Control_in;
					            myEX_W_Control_in = dut_io.ex_W_Control_in;
					            myEX_IR = dut_io.ex_IR;
					            myEX_Mem_Bypass_Val = dut_io.ex_Mem_Bypass_Val;
					            myEX_VSR1 = dut_io.ex_VSR1;
					            myEX_VSR2 = dut_io.ex_VSR2;
					            myEX_npc_in = dut_io.ex_npc_in;
					            myEX_bypass_alu_1 = dut_io.ex_bypass_alu_1;
					            myEX_bypass_alu_2 = dut_io.ex_bypass_alu_2;
					            myEX_bypass_mem_1 = dut_io.ex_bypass_mem_1;
					            myEX_bypass_mem_2 = dut_io.ex_bypass_mem_2;
					            myEX_E_Control = dut_io.ex_E_Control;
				//	            myEX_reset = dut_io.reset;
			
					            myEX_enable_execute = dut_io.ex_enable_execute;
					
					
			
endtask	
