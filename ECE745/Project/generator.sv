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

class Instruction;
	rand logic [3:0]	opcode;
	constraint controlops { opcode inside { 4'h0, 4'hc, 4'h2, 4'h6, 4'ha, 4'h3, 4'h7, 4'hb};}
	constraint arithops { opcode inside { 4'h1, 4'h5, 4'h9, 4'he };}

	rand logic [2:0]	gen_nzp;
	constraint nzpconstraints { gen_nzp inside { 3'h1, 3'h2, 3'h3, 3'h4,3'h5, 3'h6, 3'h7};}

	rand logic [11:0]	rest;
	logic	[15:0]		finalinst;

	rand logic [15:0]	loadvalue;	
	constraint loadval { loadvalue inside { 16'haaaa, 16'h5555};}

	static int ctrl_count = 0;

endclass

	Instruction instr;

task generator();
	
	if(top_io.cb.instrmem_rd != 0)
	begin

		if (instr.randomize() == 1)
		begin
			instr.finalinst[15:12] = instr.opcode;
			instr.finalinst[11:0]  = instr.rest;

			case (instr.opcode)
			
				`NOT : instr.finalinst[5:0] = 6'b111111;
	
				`JMP : begin
					instr.finalinst[11:9] = 3'b111;
					instr.finalinst[5:0] = 6'b000000;
					end
	
				`BR : begin
					 instr.finalinst[11:9] = instr.gen_nzp;
				      end
				`ADD: begin
					if(instr.finalinst[5] == 0)
					 instr.finalinst[4:3] = 2'b0;
				      end
				`AND: begin
					if(instr.finalinst[5] == 0)
					 instr.finalinst[4:3] = 2'b0;
				      end
				
			 endcase
				
		end

			top_io.cb.Instr_dout <= instr.finalinst;
			top_io.cb.Data_dout <= instr.loadvalue;
	end
endtask
	
