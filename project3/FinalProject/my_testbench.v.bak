module my_testbench();

	reg [31:0] in1;
	reg [31:0] in2;
	reg [2:0] alu_op;
	reg clk;
	reg reset;
	
	wire [31:0] out;
	
	my_alu alu (.A(in1), .B(in2), .ALUop(alu_op), .R(out), .clk(clk), .reset(reset));
	
	initial begin
		#1 in1 = 4294; in2 = 5; alu_op = 3'b111; reset = 1'b1; clk = 1'b0;
		#40000 $display ("A = %d   B = %d    aluop = %b    out = %d", in1, in2, alu_op, out);
		#5 in1 = 32'b11111110000000111111000000011110; in2 = 32'b01000010001000001100111110000011; alu_op = 3'b110;
		#40000 $display ("A = %b   B = %b    aluop = %b    out = %b", in1, in2, alu_op, out);
		#5 in1 = 32'b00101010000000111000000000000000; in2 = 32'b11000100010000011001111100000110; alu_op = 3'b101;
		#40000 $display ("A = %b   B = %b    aluop = %b    out = %b", in1, in2, alu_op, out);
		#5 in1 = 32'b10101010000000111000000000000000; in2 = 32'b11000100010000011001111100000110; alu_op = 3'b100;
		#40000 $display ("A = %b   B = %b    aluop = %b    out = %b", in1, in2, alu_op, out);
		#5 in1 = 32'b11111110000000111111000000011110; in2 = 32'b01000010001000001100111110000011; alu_op = 3'b011;
		#40000 $display ("A = %b   B = %b    aluop = %b    out = %b", in1, in2, alu_op, out);
		#5 in1 = 32'b00101010000000111000000000000000; in2 = 32'b11000100010000011001111100000110; alu_op = 3'b010;
		#40000 $display ("A = %b   B = %b    aluop = %b    out = %b", in1, in2, alu_op, out);
		#5 in1 = 32'b10101010000000111000000000000000; in2 = 32'b11000100010000011001111100000110; alu_op = 3'b001;
		#40000 $display ("A = %b   B = %b    aluop = %b    out = %b", in1, in2, alu_op, out);
		#5 in1 = 32'b10101010000000111000000000000000; in2 = 32'b11000100010000011001111100000110; alu_op = 3'b000;
		#40000 $display ("A = %b   B = %b    aluop = %b    out = %b", in1, in2, alu_op, out);
	end
	
	always
		begin
			#1	clk = ~clk;
		end
			
	always 
		begin
			#5.5 reset = 1'b0;
		end

endmodule
