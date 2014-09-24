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
 reg [3:0] Y, golden_ref_output;
 reg [4:0] i,j;
 int num_successful_tests=0;
 int num_of_tests=0;
 int cov_bin01=0,cov_bin23=0,cov_bin45=0,cov_bin67=0;
 int cov_bin89=0,cov_bin1011=0,cov_bin1213=0,cov_bin1415=0;
 int test0 = 0;
 int test1 = 0;
 int test2 = 0;
 int test3 = 0;
 int test4 = 0;
 int test5 = 0;
 int test6 = 0;
 int test7 = 0;
 real total_coverage;
 int num_sims=0;

 always #5 clk=~clk;

 initial 
	begin
		reset=1'b1;
		#10 reset=1'b0;
		for(num_sims=0;num_sims<100;num_sims=num_sims+1)
		  begin
			A=$random;
			B=$random;
			#10 golden_ref_output=A^B;
			if(golden_ref_output==Y)
				begin
					num_successful_tests=num_successful_tests+1;
					if(((A==0)||(A==1))&&((B==0)||(B==1))&&(test0 == 0)) begin cov_bin01=1; test0=1; $display($time, "bin 0 hit"); end
					if(((A==2)||(A==3))&&((A==2)||(A==3))&&(test1 == 0)) begin cov_bin23=1; test1=1; $display($time, "bin 1 hit"); end
					if(((A==4)||(A==5))&&((A==4)||(A==5))&&(test2 == 0)) begin cov_bin45=1; test2=1; $display($time, "bin 2 hit"); end
					if(((A==6)||(A==7))&&((A==6)||(A==7))&&(test3 == 0)) begin cov_bin67=1; test3=1; $display($time, "bin 3 hit"); end
					if(((A==8)||(A==9))&&((A==8)||(A==9))&&(test4 == 0)) begin cov_bin89=1; test4=1; $display($time, "bin 4 hit"); end
					if(((A==10)||(A==11))&&((A==10)||(A==11))&&(test5 == 0)) begin cov_bin1011=1; test5=1; $display($time, "bin 5 hit"); end
					if(((A==12)||(A==13))&&((A==12)||(A==13))&&(test6 == 0)) begin cov_bin1213=1; test6=1; $display($time, "bin 6 hit"); end
					if(((A==14)||(A==15))&&((A==14)||(A==15))&&(test7 == 0)) begin cov_bin1415=1; test7=1; $display($time, "bin 7 hit"); end
					total_coverage=((cov_bin01+cov_bin23+cov_bin45+cov_bin67+
									 cov_bin89+cov_bin1011+cov_bin1213+cov_bin1415)*12.5);		
					end
			#10;
			num_of_tests=num_of_tests+1;
		  end
		$display($time,"Total Coverage=%f",total_coverage);
		$display($time,"Number of Tests=%d",num_of_tests);
		$display($time,"Number of Successful Tests=%d",num_successful_tests);	
	end

 xor_design u0_xordesign(.clk(clk),
						 .reset(reset),
						 .a(A),
						 .b(B),
						 .y(Y));
 endmodule
