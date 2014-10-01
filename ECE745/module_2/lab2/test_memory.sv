//********************************************************************                                        
//  AUTHOR: Engineering Design Institute/ASIC Design and Verification	                                                     		
//  DESCRIPTION: Test bench for XOR (filename=xor_design.v)                                       
//  MODULE NAME: test_xor
//********************************************************************
 `timescale 10 ns / 1 ps
 module test_memory();
 reg clk=0;
 reg reset=0;
 logic WrEn, RdEn;
 logic [1:0] RdEn_Opcode;
 logic [15:0] Addr;
 logic [3:0] [7:0]  golden[logic[15:0]];
 logic [4:0] BitAddr;
 logic [1:0] ByteAddr;
 logic [31:0] WrBus;
 logic [31:0] RdBus;
 int num_successful_tests=0;
 int num_of_tests=0;
 int num_sims=0;
 int i,j,k;
 int StudentId=001055754;

 always #5 clk=~clk;
 initial 
	begin
		reset=1'b1;
		#10 reset=1'b0;
		
                
                for(i=0;i<50000;i=i+1)
		  begin
			WrEn=1;
			RdEn=0;
			Addr=$random;
			WrBus=$random;
                        golden[Addr] = WrBus;
			#10;
		  end


		$display("============================ TEST 1 ====================================="); 

		foreach(golden[i])
		  begin
			RdEn=1;
			WrEn=0;
			Addr=i;
			RdEn_Opcode=1;
			BitAddr=0;
			//RdEn_Opcode=i[1:0];
			#20;
                        if(RdBus == golden[i])
                            begin
		       	        $display("Memory good  Output[%d]  =          %b",i,RdBus,); 
                            end
                        else
                            begin
		       	        $display("Memory bad Output[%d]   =          %b",i,RdBus,); 
                            end
		  end

                $display("============================ TEST 2 ====================================="); 

		foreach(golden[i])
		  begin
			RdEn=1;
			WrEn=0;
			Addr=i;
			RdEn_Opcode=2;
			BitAddr=0;
                        ByteAddr = $random;
			//RdEn_Opcode=i[1:0];
			#20;
                        if(RdBus[7:0] == golden[i][ByteAddr])
                            begin
		       	        $display("Memory good  Output[%d]  =          %b",i,RdBus,); 
                            end
                        else
                            begin
		       	        $display("Memory bad Output[%d]   =          %b",i,RdBus,); 
                            end
		  end

                $display("============================ TEST 3 ====================================="); 

		foreach(golden[i])
		  begin
			RdEn=1;
			WrEn=0;
			Addr=i;
			RdEn_Opcode=0;
			BitAddr=$random;
			//RdEn_Opcode=i[1:0];
			#20;
                        if((RdBus[0] == golden[i][BitAddr[4:3]][BitAddr[2:0]]))
                            begin
		       	        $display("Memory good  Output[%d]  =          %b",i,RdBus,); 
                            end
                        else
                            begin
		       	        $display("Memory bad Output[%d]   =          %b",i,RdBus,); 
                            end
		  end
		$finish;
	end

memory u0_memory(   .clk(clk),
					.reset(reset),
					.WrEn(WrEn),
					.RdEn(RdEn),
					.RdEn_Opcode(RdEn_Opcode),
					.RdBus(RdBus),
					.BitAddr(BitAddr),
					.ByteAddr(ByteAddr),
					.Addr(Addr),
					.WrBus(WrBus),
					.StudentId(StudentId));
 endmodule
