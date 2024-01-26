module my_alu (output [31:0] R, input [31:0] A, B, input [2:0] ALUop, input clk, input reset);

wire [31:0] r1,r2,r3,r4,r5,r6;

my_and_32_bit my_and_32_bit_1(r1, A, B);
my_or_32_bit my_or_32_bit_1(r2, A, B);
my_xor_32_bit my_xor_32_bit_1(r3, A, B);
my_nor_32_bit my_nor_32_bit_1(r4, A, B);
my_add my_add_1(A, B, ALUop, r5);
mod mod1(.A(A), .B(B), .clk(clk), .reset(reset), .Result(r6));

mux8x1_32bit mux8x1_32bit_1(R, r1,r2,r3,r4,r5,r5,r5,r6, ALUop);

endmodule
