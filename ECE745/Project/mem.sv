logic [15:0] MEM_dmem_addr, MEM_dmem_din, MEM_memout;
logic MEM_dmem_rd;

task memaccess ();
	
	MEM_memout = dut_io.mem_dmem_dout;			//Check for the LD spec.

	if (dut_io.mem_mem_state === 2'b00)				//Selecting all states.
		begin
			MEM_dmem_rd = 1;
			MEM_dmem_din = 0;
			if(dut_io.mem_M_Control)
				MEM_dmem_addr = dut_io.mem_dmem_dout;
			else
				MEM_dmem_addr = dut_io.mem_M_Addr;
		end		
		
	else if(dut_io.mem_mem_state === 2'b01)
		begin
			MEM_dmem_rd = 1;
			MEM_dmem_din = 0;
			MEM_dmem_addr = dut_io.mem_M_Addr;
		end
				
	else if(dut_io.mem_mem_state === 2'b10)
		begin
			MEM_dmem_rd = 0;
			MEM_dmem_din = dut_io.mem_M_Data;
			if(dut_io.mem_M_Control)
				MEM_dmem_addr = dut_io.mem_dmem_dout;
			else
				MEM_dmem_addr = dut_io.mem_M_Addr;
		end		
				
	else if(dut_io.mem_mem_state === 2'b11)
		begin
			MEM_dmem_rd = 1'bz;
			MEM_dmem_din = 16'bz;
			MEM_dmem_addr = 16'bz;
		end
		

	if (MEM_dmem_rd !== dut_io.mem_dmem_rd)
		$display ($time, "Error in mem_dmem_rd");

	if (MEM_dmem_din !== dut_io.mem_dmem_din)
		$display ($time, "Error in mem_dmem_din");

	if (MEM_dmem_addr !== dut_io.mem_dmem_addr)
		$display ($time, "Error in mem_dmem_addr");

	if (MEM_memout !== dut_io.mem_memout)
		$display ($time, "Error in mem_memout");


endtask
	
