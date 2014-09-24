//********************************************************************                                        
//  AUTHOR: Engineering Design Institute/ASIC Design and Verification	                                                     		
//  DESCRIPTION: Test bench for XOR (filename=xor_design.v)                                       
//  MODULE NAME: test_xor
//********************************************************************
 `timescale 10 ns / 1 ps
 module test_xor();
 reg clk=0;
 reg reset=0;
 reg [3:0] A=0, B=0;
 reg [3:0] Y, golden_ref_output, test_test;
 reg [4:0] i,j;
 int num_successful_tests=0;
 int num_of_tests=0;
 int con=0;

 always #5 clk=~clk;

 initial 
	begin
		reset=1'b1;
		#10 reset=1'b0;
		for (i=0;i<16;i=i+1)
			begin
				for(j=0;j<16;j=j+1)
					begin
						A=i;
						B=j;
						#5;
						golden_ref_output=A^B;
                                                test_test = {1'b1,A[2:0]^B[2:0]};
                                                #2
                                                if(test_test == Y)
                                                    begin
                                                        con = con + 1;
                                                    end
                                                if(golden_ref_output == Y)
                                                    begin
						        num_successful_tests=num_successful_tests+1;
                                                    end
                                                #3;
						num_of_tests=num_of_tests+1;
					end
			end
			$display($time,"Number of Tests=%d",num_of_tests);
			$display($time,"Number of Successful Tests=%d",num_successful_tests);
			$display($time,"Number of con=%d",con);
	end

 xor_design u0_xordesign(.clk(clk),
						 .reset(reset),
						 .a(A),
						 .b(B),
						 .y(Y));
 endmodule
