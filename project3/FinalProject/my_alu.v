module my_alu (output [31:0] alu_result, output zero_bit, input [31:0] alu_src1, alu_src2, input [2:0] alu_ctr);

wire [31:0] r1,r2,r3,r4,r5,r6;
wire temp;

my_and_32_bit my_and_32_bit_1(r1, alu_src1, alu_src2);
my_or_32_bit my_or_32_bit_1(r2, alu_src1, alu_src2);
my_xor_32_bit my_xor_32_bit_1(r3, alu_src1, alu_src2);
my_nor_32_bit my_nor_32_bit_1(r4, alu_src1, alu_src2);
my_add my_add_1(alu_src1, alu_src2, alu_ctr, r5);

mux8x1_32bit mux8x1_32bit_1(alu_result, r1,r2,r3,r4,r5,r5,r5,r6, alu_ctr);

my_add my_add_2(alu_result, 32'b00000000000000000000000000000001, 3'b100, r6);
not not1(temp, alu_src1[31]);
and and1(zero_bit, temp, r6[0]);

endmodule
