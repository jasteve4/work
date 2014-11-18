program LC3_test( LC3_io top_io, dut_Probe_if dut_io);


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

`include "generator.sv"
`include "execute.sv"
`include "WB.sv"
`include "if.sv"
`include "decode.sv"
`include "mem.sv"
`include "control.sv"
`include "const.svi"	
	
	covergroup ALU_opr_covg;
	
		Cov_ALU_opcode: coverpoint dut_io.dec_IR[15:12]
		{
			bins ALU_opcode1 = {`ADD};
			bins ALU_opcode2 = {`AND};
			bins ALU_opcode3 = {`NOT};
		}
		Cov_Imm_en: coverpoint dut_io.dec_IR[5]
		{
			bins immediate_en = {1};
		}
		Cov_Imm_de: coverpoint dut_io.dec_IR[5]
		{
			bins immediate_de = {0};
		}
		Cov_SR1: coverpoint dut_io.dec_IR[8:6]
		{
			bins zero	= {0};
			bins one	= {1};
			bins two	= {2};
			bins three	= {3};
			bins four	= {4};
			bins five	= {5};
			bins six	= {6};
			bins seven	= {7};
		}
		Cov_SR2: coverpoint dut_io.dec_IR[2:0] iff (dut_io.dec_IR[5] == 0)
		{
			bins zero	= {0};
			bins one	= {1};
			bins two	= {2};
			bins three	= {3};
			bins four	= {4};
			bins five	= {5};
			bins six	= {6};
			bins seven	= {7};
		}
		Cov_DR: coverpoint dut_io.dec_IR[11:9]
		{
			bins zero	= {0};
			bins one	= {1};
			bins two	= {2};
			bins three	= {3};
			bins four	= {4};
			bins five	= {5};
			bins six	= {6};
			bins seven	= {7};
		}
		
		Cov_Imm_value : coverpoint dut_io.dec_IR[4:0] iff(dut_io.dec_IR[5] == 1);
		
		Xc_opcode_Imm_en : cross Cov_ALU_opcode , Cov_Imm_en;
		
		Xc_opcode_sr1_dr_imm_en : cross Cov_ALU_opcode , Cov_Imm_en, Cov_SR1, Cov_DR;
		
		Xc_opcode_sr1_dr_sr2 : cross Cov_ALU_opcode , Cov_Imm_de, Cov_SR1, Cov_DR, Cov_SR2
		{
			ignore_bins NOT = binsof(Cov_ALU_opcode.ALU_opcode3);
		}
		
		Cov_aluin1: coverpoint EX_aluin1
		{
			option.auto_bin_max=8;
		}
		Cov_aluin2: coverpoint EX_aluin2
		{
			option.auto_bin_max=8;
		}
		Cov_aluin1_corner1: coverpoint EX_aluin1
		{
			bins all_0 	= {0};
		}
		Cov_aluin1_corner2: coverpoint EX_aluin1
		{
			bins all_1 	= {16'hffff};
		}
		Cov_aluin1_corner3: coverpoint EX_aluin1
		{
			bins alt_0_1= {16'h5555};
		}
		Cov_aluin1_corner4: coverpoint EX_aluin1
		{
			bins alt_1_0= {16'haaaa};
		}
		Cov_aluin1_corner5: coverpoint EX_aluin1
		{
			wildcard bins pos	=	{16'b0???????????????};
		}
		Cov_aluin1_corner6: coverpoint EX_aluin1
		{
			wildcard bins neg	=	{16'b1???????????????};
		}
		
		Cov_aluin2_corner1: coverpoint EX_aluin2
		{
			bins all_0 	= {0};
		}
		Cov_aluin2_corner2: coverpoint EX_aluin2
		{
			bins all_1 	= {16'hffff};
		}
		Cov_aluin2_corner3: coverpoint EX_aluin2
		{
			bins alt_0_1= {16'h5555};
		}
		Cov_aluin2_corner4: coverpoint EX_aluin2
		{
			bins alt_1_0= {16'haaaa};
		}
		Cov_aluin2_corner5: coverpoint EX_aluin2
		{
			wildcard bins pos	=	{16'b0???????????????};
		}
		Cov_aluin2_corner6: coverpoint EX_aluin2
		{
			wildcard bins neg	=	{16'b1???????????????};
		}
		
		Xc_opcode_aluin1_corn1 : cross Cov_ALU_opcode, Cov_aluin1_corner1;
		Xc_opcode_aluin1_corn2 : cross Cov_ALU_opcode, Cov_aluin1_corner2;
		Xc_opcode_aluin1_corn3 : cross Cov_ALU_opcode, Cov_aluin1_corner3;
		Xc_opcode_aluin1_corn4 : cross Cov_ALU_opcode, Cov_aluin1_corner4;
		Xc_opcode_aluin1_corn5 : cross Cov_ALU_opcode, Cov_aluin1_corner5;
		Xc_opcode_aluin1_corn6 : cross Cov_ALU_opcode, Cov_aluin1_corner6;
		
		Xc_opcode_aluin2_corn1 : cross Cov_ALU_opcode, Cov_aluin2_corner1;
		Xc_opcode_aluin2_corn2 : cross Cov_ALU_opcode, Cov_aluin2_corner2;
		Xc_opcode_aluin2_corn3 : cross Cov_ALU_opcode, Cov_aluin2_corner3;
		Xc_opcode_aluin2_corn4 : cross Cov_ALU_opcode, Cov_aluin2_corner4;
		Xc_opcode_aluin2_corn5 : cross Cov_ALU_opcode, Cov_aluin2_corner5;
		Xc_opcode_aluin2_corn6 : cross Cov_ALU_opcode, Cov_aluin2_corner6;
		
		Cov_opcode_aluin_allZero: cross Cov_ALU_opcode, Cov_aluin1_corner1, Cov_aluin2_corner1;
		
		Cov_opcode_aluin_allOne: cross Cov_ALU_opcode, Cov_aluin1_corner2, Cov_aluin2_corner2;
		
		Cov_opcode_aluin_Zero_One: cross Cov_ALU_opcode, Cov_aluin1_corner1, Cov_aluin2_corner2;
		
		Cov_opcode_aluin_One_Zero: cross Cov_ALU_opcode, Cov_aluin1_corner2, Cov_aluin2_corner1;
		
		Cov_opcode_aluin_alt01_alt10: cross Cov_ALU_opcode, Cov_aluin1_corner3, Cov_aluin2_corner4;
		
		Cov_opcode_aluin_alt10_alt01: cross Cov_ALU_opcode, Cov_aluin1_corner4, Cov_aluin2_corner3;
		
		Cov_opcode_aluin_alt10_alt10: cross Cov_ALU_opcode, Cov_aluin1_corner3,Cov_aluin2_corner3;
		
		Cov_opcode_aluin_alt01_alt01: cross Cov_ALU_opcode, Cov_aluin1_corner4, Cov_aluin2_corner4;
		
		Cov_opcode_aluin_pos_pos: cross Cov_ALU_opcode, Cov_aluin1_corner5, Cov_aluin2_corner5;
		
		Cov_opcode_aluin_pos_neg: cross Cov_ALU_opcode, Cov_aluin1_corner5, Cov_aluin2_corner6;
		
		Cov_opcode_aluin_neg_pos: cross Cov_ALU_opcode, Cov_aluin1_corner6, Cov_aluin2_corner5;
		
		Cov_opcode_aluin_neg_neg: cross Cov_ALU_opcode, Cov_aluin1_corner6, Cov_aluin2_corner6;
		
	endgroup


	covergroup MEM_OPR_cg;

	Cov_mem_opcode: coverpoint top_io.Instr_dout[`OP_CODE] 
	{	bins MEM_opcode = { `LD, `LDI, `LDR,  `LEA, `ST, `STR, `STI }; }


	Cov_BaseR: coverpoint top_io.Instr_dout[`BASER] iff ((top_io.Instr_dout[`OP_CODE] == `LDR ) || (top_io.Instr_dout[`OP_CODE] == `STR));

	
	Cov_SR: coverpoint top_io.Instr_dout[`SR] iff ( top_io.Instr_dout[13:12] == 2'b11 );


	Cov_DR: coverpoint top_io.Instr_dout[`DR] iff ( (top_io.Instr_dout[13:12] == 2'b10));

	// PCOffset6 8 bins bins Only (Loads and Stores) & (!LDR || !STR)
	Cov_PCoffset9: coverpoint top_io.Instr_dout[`PCOFFSET9] iff( ( (top_io.Instr_dout[13:12] == 2'b10) ||
																																	(top_io.Instr_dout[13:12] == 2'b11 ))
																																&& 
																																	( (top_io.Instr_dout[`OP_CODE] != `LDR) &&
																																		(top_io.Instr_dout[`OP_CODE] != `STR )))
		{	option.auto_bin_max=8;}

	// PCOffset6 cornder cases bins Only (Loads and Stores) & (!LDR || !STR)
	Cov_PCoffset9_c: coverpoint top_io.Instr_dout[`PCOFFSET9] iff (((top_io.Instr_dout[13:12] == 2'b10) ||
																																	(top_io.Instr_dout[13:12] == 2'b11 ))
																																&& 
																																	( (top_io.Instr_dout[`OP_CODE] != `LDR) &&
																																		(top_io.Instr_dout[`OP_CODE] != `STR )))
		{	bins corners[] = {9'h000, 9'h100, 9'h1FF}; }

	// PCOffset6 8 bins Only LDR STR
	Cov_PCoffset6: coverpoint top_io.Instr_dout[`PCOFFSET6] iff ( (top_io.Instr_dout[`OP_CODE] == `LDR) || (top_io.Instr_dout[`OP_CODE] == `STR ) )
		{	option.auto_bin_max=8;}
		


	// Cross Coverage for offset6
	Xc_BaseR_DR_offset6: cross  Cov_BaseR, Cov_DR, Cov_PCoffset6 iff (top_io.Instr_dout[`OP_CODE] == `LDR); 
	Xc_BaseR_SR_offset6: cross  Cov_BaseR, Cov_SR, Cov_PCoffset6 iff (top_io.Instr_dout[`OP_CODE] == `STR); 
	
	Xc_DR_offset9: cross  Cov_DR, Cov_PCoffset9 iff ( (top_io.Instr_dout[13:12] == 2'b10) && (top_io.Instr_dout[`OP_CODE] != `LDR)); 
	Xc_SR_offset9: cross  Cov_SR, Cov_PCoffset9 iff ( (top_io.Instr_dout[13:12] == 2'b11) && (top_io.Instr_dout[`OP_CODE] != `STR)); 


	Cov_PCoffset6_c: coverpoint top_io.Instr_dout[`PCOFFSET6] iff ( (top_io.Instr_dout[`OP_CODE] == `LDR) || (top_io.Instr_dout[`OP_CODE] == `STR ) )

		{ bins corners[] = {6'h00, 6'h20, 6'h3F, 6'h2a, 6'h15}; }		

endgroup



	covergroup BR_OPR_cg;	
		Cov_NZP: coverpoint EX_NZP
		{
			bins z	= {3'b010};
			bins np = {3'b101};
			bins p	= {3'b001}; 
			bins zp	= {3'b011}; 
			bins n	= {3'b100}; 
			bins nz	= {3'b110}; 
			bins others = default;
		}

		Cov_BaseR: coverpoint top_io.Instr_dout[`BASER] iff(top_io.Instr_dout[`OP_CODE] == `JMP);

		Cov_psr: coverpoint WB_psr
		{
			bins z = {3'b010};
			bins n = {3'b100};
			bins p = {3'b001};
			bins others = default;
		}

		Xc_NZP_PSR: cross Cov_NZP, Cov_psr;
	endgroup
	
	covergroup order_of_instr;
	
		Cov_add_o_instr: coverpoint top_io.Instr_dout[`OP_CODE]
		{		bins addop = {`ADD};		}
		
		Cov_and_o_instr: coverpoint top_io.Instr_dout[`OP_CODE]
		{		bins andop = {`AND};		}
		
		Cov_not_o_instr: coverpoint top_io.Instr_dout[`OP_CODE]
		{		bins notop = {`NOT};		}
		
		Cov_LEA_o_instr: coverpoint top_io.Instr_dout[`OP_CODE]
		{		bins leaop = {`LEA};		}
		
		
		Cov_rest_instr: coverpoint dut_io.dec_IR[`OP_CODE]
		{
			bins addop = {`ADD};		
			bins andop = {`AND};		
			bins notop = {`NOT};		
			bins ldop = {`LD};		
			bins ldrop = {`LDR};	
			bins ldiop = {`LDI};	
			bins leaop = {`LEA};	
			bins stoop = {`ST};		
			bins strop = {`STR};		
			bins stiop = {`STI};	
			bins brop = {`BR};
			bins jmpop = {`JMP};
		}
	
		Xc_add_all: cross Cov_add_o_instr, Cov_rest_instr;
		Xc_and_all: cross Cov_and_o_instr, Cov_rest_instr;
		Xc_not_all: cross Cov_not_o_instr, Cov_rest_instr;
		Xc_lea_all: cross Cov_LEA_o_instr, Cov_rest_instr;
	endgroup
	
	property br_taken_jmp;
	@(top_io.cb)
	((top_io.Instr_dout[`OP_CODE] == `JMP) |-> ##2(CON_br_taken == 1));
	endproperty
	jump_assertion: cover property(br_taken_jmp);

	
	property br_taken;
	@(top_io.cb)
	(((top_io.Instr_dout[`OP_CODE] == `BR) && (|(top_io.Instr_dout[11:9] ==1)))  |-> ##2(CON_br_taken == 1));
	endproperty
	br_assertion: cover property(br_taken);
	
	property reset_prop;
	@(top_io.cb)
	((dut_io.reset == 1'b1) |-> ((dut_io.fetch_pc == 16'h3000) && (dut_io.fetch_npc_out == 16'h3001)));
	endproperty
	reset_prop_assertion: cover property(reset_prop);

	/*property enable_all_prop;
	@(top_io.cb)
	(((dut_io.reset == 1'b1) && (##1( dut_io.reset == 0))) |-> ((dut_io.control_enable_decode == 1) && (##1 dut_io.control_enable_execute == 1) && (##2 dut_io.control_enable_writeback == 1)))  ;
	endproperty
	enable_allprop_assertion: cover property(enable_all_prop);*/
	
			ALU_opr_covg ALUOPS= new;
			MEM_OPR_cg MEMOPS = new;		
			BR_OPR_cg BROPS = new;	
			order_of_instr ORDERINST = new;
int count = 0;


	initial
	
		begin


			@top_io.cb;
			top_io.reset = 1'b1;
			fork
			fetch();
			decode();
			execute();
			memaccess();
			WB();
			control();
			join

			ALUOPS.sample();
			MEMOPS.sample();	
			BROPS.sample();
			ORDERINST.sample();
			@top_io.cb;
			@top_io.cb;
			top_io.cb.reset <= 1'b0;
			top_io.complete_instr <= 1'b1;
			top_io.complete_data <= 1'b1;
			top_io.cb.Instr_dout <= 16'h5020;
			top_io.cb.Data_dout <= 16'h50;
			fork
			fetch();
			decode();
			execute();
			memaccess();
			WB();
			control();
			join
		
			ALUOPS.sample();
			MEMOPS.sample();
			BROPS.sample();
			ORDERINST.sample();


	while (count<8)
	begin
		@top_io.cb;


		if(top_io.cb.instrmem_rd != 0)
		begin
			case	(count)
					//AND R0 R0 0
					0:top_io.cb.Instr_dout <= 16'b101000000100000;
					
					//AND R1 R1 0
					1:top_io.cb.Instr_dout <= 16'b101001001100000;
					
					//AND R2 R2 0
					2:top_io.cb.Instr_dout <= 16'b101010010100000;

					//AND R3 R3 0
					3:top_io.cb.Instr_dout <= 16'b101011011100000;

					//AND R4 R4 0
					4:top_io.cb.Instr_dout <= 16'b101100100100000;

					//AND R5 R5 0
					5:top_io.cb.Instr_dout <= 16'b101101101100000;

					//AND R6 R6 0
					6:top_io.cb.Instr_dout <= 16'b101110110100000;

					//AND R7 R7 0
					7:top_io.cb.Instr_dout <= 16'b101111111100000;
		
			endcase
		end	
		
		if(top_io.cb.instrmem_rd != 0)
		count++;
			
			fork
			fetch();
			decode();
			execute();
			memaccess();
			WB();
			control();
			join

			
			ALUOPS.sample();
			MEMOPS.sample();
			BROPS.sample();
			ORDERINST.sample();
	end


		instr = new();


	while (count<4000000)
	begin
		if(instr.ctrl_count < 8)
		begin
			if(top_io.cb.instrmem_rd == 1)
				instr.ctrl_count++;
			instr.arithops.constraint_mode (1);	
			instr.controlops.constraint_mode (0);	// initially
		end

		if(instr.ctrl_count === 8)
		begin
			instr.ctrl_count = 0;	
			instr.arithops.constraint_mode (0);	
			instr.controlops.constraint_mode (1);	
		end
	
		if((count > 0) && (count < 1000))
			instr.loadval.constraint_mode (0);

		if((count > 1000) && (count < 30000))
			instr.loadval.constraint_mode (1);
		
		if(count > 30000) 
			instr.loadval.constraint_mode (0);

	 
		@top_io.cb;
		begin

			generator();	
			
			
			fork
			fetch();
			decode();
			execute();
			memaccess();
			WB();
			control();
			join

			ALUOPS.sample();
			MEMOPS.sample();
			BROPS.sample();
			ORDERINST.sample();
		count++;
		end
	end
	
	
		#100 $finish;
		end
endprogram: LC3_test
			
