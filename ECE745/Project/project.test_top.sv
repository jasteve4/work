
module LC3_test_top;
	parameter simulation_cycle = 20;

	reg  SysClock;
	LC3_io top_io(SysClock);  // Instantiate the top level interface of the testbench to be used for driving the LC3 and reading the LC3 outputs.
	
	// Instantiating and Connecting the probe signals for the Fetch block with the DUT fetch block signals using the "dut" instantation of LC3 below.
	dut_Probe_if dut_io (	
					.reset (dut.Fetch.reset),
					.fetch_enable_updatePC(dut.Fetch.enable_updatePC), 
					.fetch_enable_fetch(dut.Fetch.enable_fetch), 
					.fetch_pc(dut.Fetch.pc), 
					.fetch_npc_out(dut.Fetch.npc_out),
					.fetch_instrmem_rd(dut.Fetch.instrmem_rd),
					.fetch_taddr(dut.Fetch.taddr),
					.fetch_br_taken(dut.Fetch.br_taken),

					.dec_enable_decode(dut.Dec.enable_decode),
					.dec_instr_dout(dut.Dec.dout),
					.dec_E_Control(dut.Dec.E_Control),
					.dec_npc_in(dut.Dec.npc_in),
//					.dec_psr(dut.Dec.psr),
					.dec_Mem_Control(dut.Dec.Mem_Control),
					.dec_W_Control(dut.Dec.W_Control),
					.dec_IR(dut.Dec.IR),
					.dec_npc_out(dut.Dec.npc_out),

//Ex 
					.ex_E_Control(dut.Ex.E_Control),
					.ex_bypass_alu_1(dut.Ex.bypass_alu_1),
					.ex_bypass_alu_2(dut.Ex.bypass_alu_2),
					.ex_IR(dut.Ex.IR),
					.ex_npc_in(dut.Ex.npc),
					.ex_W_Control_in(dut.Ex.W_Control_in),
					.ex_Mem_Control_in(dut.Ex.Mem_Control_in),
					.ex_VSR1(dut.Ex.VSR1),
					.ex_VSR2(dut.Ex.VSR2),
					.ex_bypass_mem_1(dut.Ex.bypass_mem_1),
					.ex_bypass_mem_2(dut.Ex.bypass_mem_2),
					.ex_Mem_Bypass_Val(dut.Ex.Mem_Bypass_Val),
					.ex_enable_execute(dut.Ex.enable_execute),
					.ex_W_Control_out(dut.Ex.W_Control_out),
					.ex_Mem_Control_out(dut.Ex.Mem_Control_out),
					.ex_aluout(dut.Ex.aluout),
					.ex_pcout(dut.Ex.pcout),
					.ex_sr1(dut.Ex.sr1),
					.ex_sr2(dut.Ex.sr2),
					.ex_dr(dut.Ex.dr),
					.ex_M_Data(dut.Ex.M_Data),
					.ex_NZP(dut.Ex.NZP),
					.ex_IR_Exec(dut.Ex.IR_Exec),

//MemAccess	
					.mem_mem_state(dut.MemAccess.mem_state),
					.mem_M_Control(dut.MemAccess.M_Control),
					.mem_M_Data(dut.MemAccess.M_Data),
					.mem_M_Addr(dut.MemAccess.M_Addr),
					.mem_memout(dut.MemAccess.memout),
					.mem_dmem_addr(dut.MemAccess.Data_addr),
					.mem_dmem_din(dut.MemAccess.Data_din),
					.mem_dmem_dout(dut.MemAccess.Data_dout),
					.mem_dmem_rd(dut.MemAccess.Data_rd),

//	Writeback	WB 	
					.wb_enable_writeback(dut.WB.enable_writeback),
					.wb_W_Control_in(dut.WB.W_Control),
					.wb_aluout(dut.WB.aluout),
					.wb_memout(dut.WB.memout),
					.wb_pcout(dut.WB.pcout),
					.wb_npc(dut.WB.npc),
					.wb_sr1(dut.WB.sr1),
					.wb_sr2(dut.WB.sr2),
					.wb_dr(dut.WB.dr),
					.wb_VSR1(dut.WB.d1),
					.wb_VSR2(dut.WB.d2),
					.wb_psr(dut.WB.psr),

//Ctrl
				.control_IR(dut.Ctrl.IR),
				.control_complete_data(dut.Ctrl.complete_data),
				.control_complete_instr(dut.Ctrl.complete_instr),
				.control_bypass_alu_1(dut.Ctrl.bypass_alu_1),
				.control_bypass_alu_2(dut.Ctrl.bypass_alu_2),
				.control_bypass_mem_1(dut.Ctrl.bypass_mem_1),
				.control_bypass_mem_2(dut.Ctrl.bypass_mem_2),
				.control_enable_fetch(dut.Ctrl.enable_fetch),
				.control_enable_decode(dut.Ctrl.enable_decode),
				.control_enable_execute(dut.Ctrl.enable_execute),
				.control_enable_writeback(dut.Ctrl.enable_writeback),
				.control_enable_updatePC(dut.Ctrl.enable_updatePC),
				.control_mem_state(dut.Ctrl.mem_state),
				.control_NZP(dut.Ctrl.NZP),
				.control_psr(dut.Ctrl.psr),
				.control_IR_Exec(dut.Ctrl.IR_Exec),
				.control_imem_dout(dut.Ctrl.Instr_dout),
				.control_br_taken(dut.Ctrl.br_taken)
				);

	// Passing the top level interface and probe interface to the testbench.
	LC3_test test(top_io, dut_io); 
	 
	// Instantiating the top-level DUT.
	LC3 dut(
		.clock(top_io.clock), 
		.reset(top_io.reset), 
		.pc(top_io.pc), 
		.instrmem_rd(top_io.instrmem_rd), 
		.Instr_dout(top_io.Instr_dout), 
		.Data_addr(top_io.Data_addr), 
		.complete_instr(top_io.complete_instr), 
		.complete_data(top_io.complete_data),
		.Data_din(top_io.Data_din),
		.Data_dout(top_io.Data_dout),
		.Data_rd(top_io.Data_rd)

		);

	initial 
	begin
		SysClock = 0;
		forever 
		begin
			#(simulation_cycle/2)
			SysClock = ~SysClock;
		end
	end
endmodule

