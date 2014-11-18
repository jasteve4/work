logic [15:0] 	WB_reg_file[0:7];
logic [15:0] 	WB_DR_in;
logic [2:0]		WB_psr;
logic [15:0] 	WB_VSR1, WB_VSR2;

// buffered inputs
logic [15:0]	myWB_aluout, myWB_pcout, myWB_memout;
logic [2:0]		myWB_dr;
logic [1:0]		myWB_W_Control_in;
logic			myWB_enable_writeback;
logic			myWB_reset;


task WB ();

		

		if(dut_io.reset)
			begin
				WB_psr = 3'b000;
			end
		else
		begin
		
			casex (myWB_W_Control_in)
				
				2'b00: WB_DR_in = myWB_aluout;
				2'b01: WB_DR_in = myWB_memout;
				2'b10: WB_DR_in = myWB_pcout;
				default: $display("error in w_control_in");
			endcase
			
			if (myWB_enable_writeback)
			begin
				if(WB_DR_in[15] === 1'b1)
					begin 	WB_psr = 3'b100;				// negative value
					end			
				else
					//psr = (DR_in > 0) ? 3'b001 : 3'b010 ; 
					begin
					if (WB_DR_in) WB_psr = 3'b001;	//value is positive and non zero
					else 	   	  WB_psr = 3'b010;	// value is zero
					end
			end
	
			if (myWB_enable_writeback) WB_reg_file[myWB_dr] = WB_DR_in;		//data written in reg file
		end
		
			WB_VSR1 = WB_reg_file[dut_io.wb_sr1];		// asynch
			WB_VSR2 = WB_reg_file[dut_io.wb_sr2];		// asynch
		
			// CHECKING
			
			if (WB_VSR1 !== dut_io.wb_VSR1)
						$display ($time, " Writeback block error: VSR1 mismatch");
						
			if (WB_VSR2 !== dut_io.wb_VSR2)
						$display ($time, " Writeback block error: VSR2 mismatch");
						
			if (WB_psr !== dut_io.wb_psr)
						$display ($time, " Writeback block error: PSR mismatch");
						
			// Assignment
			
				myWB_aluout = dut_io.wb_aluout; 
				myWB_pcout = dut_io.wb_pcout;
				myWB_memout = dut_io.wb_memout;
				myWB_dr = dut_io.wb_dr;
				myWB_W_Control_in = dut_io.wb_W_Control_in;
				myWB_enable_writeback = dut_io.wb_enable_writeback;
				myWB_reset = dut_io.reset;

	
endtask
		
		
		
