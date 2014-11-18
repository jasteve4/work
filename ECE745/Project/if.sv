logic			gr_if_instrmem_rd;
logic	[15:0]		gr_if_pc;
logic	[15:0]		gr_if_npc_out;

logic			myIF_enable_updatePC, myIF_enable_fetch, myIF_br_taken;
logic	[15:0]		myIF_taddr;
logic 	[1:0] 		select;

task fetch ();

	if (dut_io.reset)	
	begin
		gr_if_pc = 16'h3000;
		gr_if_npc_out = 16'h3001;
		gr_if_instrmem_rd = 1'h1;
	end

	else
	begin

		select = {myIF_enable_updatePC, myIF_br_taken};

		casex (select)

			 3'b10:
		 	begin
				gr_if_pc = gr_if_npc_out;
		 	end

		 	3'b11:
		 	begin
				gr_if_pc =myIF_taddr;
		 	end

		 	3'b0x:	
		 	begin
				gr_if_pc = gr_if_pc;
			 end
		
			default:
			begin
			end

	 	endcase

		gr_if_npc_out = gr_if_pc + 1;

	end
	#1;
	casex (dut_io.fetch_enable_fetch)
		1'b0:
				begin
				gr_if_instrmem_rd = 1'b0;			// should be z
				end

		1'b1:
				begin
				gr_if_instrmem_rd = 1'b1;
				end
	endcase

		
		myIF_enable_updatePC = dut_io.fetch_enable_updatePC; 
		myIF_br_taken = dut_io.fetch_br_taken;
		myIF_taddr = dut_io.fetch_taddr;
		myIF_enable_fetch = dut_io.fetch_enable_fetch;

	
	
	
	
	if (gr_if_instrmem_rd !==  dut_io.fetch_instrmem_rd)
		$display ($time, "fetch error - instrmem_rd");

	if (gr_if_pc !==  dut_io.fetch_pc)
		$display ($time, "fetch error - pc");

	if (gr_if_npc_out !==  dut_io.fetch_npc_out)
		$display ($time, "fetch error - npc_out");
	
endtask

