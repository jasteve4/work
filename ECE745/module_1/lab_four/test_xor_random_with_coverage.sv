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
					if((A==0)||(A==1)) cov_bin01=1;
					if((A==2)||(A==3)) cov_bin23=1;
					if((A==4)||(A==5)) cov_bin45=1;
					if((A==6)||(A==7)) cov_bin67=1;
					if((A==8)||(A==9)) cov_bin89=1;
					if((A==10)||(A==11)) cov_bin1011=1;
					if((A==12)||(A==13)) cov_bin1213=1;
					if((A==14)||(A==15)) cov_bin1415=1;
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
