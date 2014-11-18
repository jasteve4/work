interface LC3_io(input bit clock);
  	
	logic reset, instrmem_rd, complete_instr, complete_data, Data_rd; 
	logic [15:0] pc, Instr_dout, Data_addr,  Data_dout, Data_din;
  	

  	clocking cb @(posedge clock);
 	default input #1 output #0;

		// instruction memory side
		input	pc; 
   		input	instrmem_rd;  
   		output Instr_dout;

		// data memory side
		input Data_din;
		input Data_rd;
		input Data_addr;		
		output Data_dout;
		
		output reset;
		
		
  	endclocking

  	modport TB(clocking cb, output complete_data, output complete_instr);   //modify to include reset
endinterface


interface dut_Probe_if(	

					input	logic		reset,
					// fetch block interface signals
					input   logic 				fetch_enable_updatePC,fetch_enable_fetch,fetch_br_taken, 
					input   logic 		[15:0] 		fetch_taddr,
					input   logic 				fetch_instrmem_rd,
					input   logic		[15:0]		fetch_pc,fetch_npc_out,
					
					//decode block interface signals
					input logic [15:0] 	dec_npc_in, dec_instr_dout,
					input logic 		dec_enable_decode,
				//	input logic [2:0]	dec_psr,
					input logic [15:0]	dec_IR, dec_npc_out,
					input logic [5:0]	dec_E_Control,
					input logic [1:0]	dec_W_Control,
					input logic 		dec_Mem_Control,
					
					//execute block
					input logic [5:0]	ex_E_Control,
					input logic [15:0]	ex_IR, ex_npc_in,
					input logic 		ex_bypass_alu_1, ex_bypass_alu_2, ex_bypass_mem_1, ex_bypass_mem_2,
					input logic	[15:0]	ex_VSR1, ex_VSR2, ex_Mem_Bypass_Val,
					input logic [1:0]	ex_W_Control_in, ex_W_Control_out,
					input logic			ex_Mem_Control_in, ex_Mem_Control_out, ex_enable_execute,
					
					input logic [15:0]	ex_aluout, ex_pcout,
					input logic [2:0]	ex_dr, ex_sr1, ex_sr2, ex_NZP,
					input logic [15:0]	ex_IR_Exec, ex_M_Data,
					
					//writeback
					input logic [15:0]	wb_npc, wb_aluout, wb_pcout, wb_memout,
					input logic	[1:0]	wb_W_Control_in,
					input logic 		wb_enable_writeback,
					input logic	[2:0]	wb_dr, wb_sr1, wb_sr2,
					input logic [15:0]	wb_VSR1, wb_VSR2,
					input logic [2:0]	wb_psr,
					
					//memory if
					input logic [15:0]	mem_M_Data, mem_M_Addr, mem_dmem_dout, mem_dmem_addr, mem_dmem_din, mem_memout,
					input logic			mem_M_Control, mem_dmem_rd,
					input logic	[1:0]	mem_mem_state,
					
					//control 
					input logic 		control_complete_data, control_complete_instr,
					input logic	[15:0]	control_IR, control_IR_Exec, control_imem_dout,
					input logic	[2:0]	control_psr, control_NZP,
					input logic			control_enable_updatePC, control_enable_fetch, control_enable_decode, control_enable_execute,
					input logic			control_enable_writeback, control_br_taken,
					input logic			control_bypass_alu_1, control_bypass_alu_2, control_bypass_mem_1, control_bypass_mem_2,
					input logic	[1:0]	control_mem_state
					);
endinterface
