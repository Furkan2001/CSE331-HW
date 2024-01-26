module my_add (input [31:0] A, input [31:0] B, input [2:0] alu_op, output [31:0] Result);

wire w1,w2,w3,w4,w5; // w4 is V in lesson4.pdf, 1-bit Alu for MSB..   

wire [31:0] temp; // most significan bitleri tamamen 0 dır, least significant biti ise less_than kıyaslamasına göre 0 veya 1 olur.

wire [31:0] xor_B; //B nin xor u nun alınmış halidir.

wire [31:0] R; //Toplama veya çıkarma işlemlerinin sonucunu tutar. Mux da kullanacağım aşağıda.

wire [31:0] g,p,c;
wire [7:0] G,P,C;

// I set up this equation because subtraction requires less than and sub, because the middle bit of the ALUop value of the add operation is 0.
//carryIn = (alu2 xnor alu1) + (alu1 xnor alu0)   control for if carrIn exist or not
xnor xnor1(w1, alu_op[2], alu_op[1]);
xnor xnor2(w2, alu_op[1], alu_op[0]);
or or1(w3, w2, w1); //w3 is carryIn

//I taked reverse of B, If it is necessary to perform subtraction
xor xor1(xor_B[0], w3, B[0]);
xor xor2(xor_B[1], w3, B[1]);
xor xor3(xor_B[2], w3, B[2]);
xor xor4(xor_B[3], w3, B[3]);
xor xor5(xor_B[4], w3, B[4]);
xor xor6(xor_B[5], w3, B[5]);
xor xor7(xor_B[6], w3, B[6]);
xor xor8(xor_B[7], w3, B[7]);
xor xor9(xor_B[8], w3, B[8]);
xor xor10(xor_B[9], w3, B[9]);
xor xor11(xor_B[10], w3, B[10]);
xor xor12(xor_B[11], w3, B[11]);
xor xor13(xor_B[12], w3, B[12]);
xor xor14(xor_B[13], w3, B[13]);
xor xor15(xor_B[14], w3, B[14]);
xor xor16(xor_B[15], w3, B[15]);
xor xor17(xor_B[16], w3, B[16]);
xor xor18(xor_B[17], w3, B[17]);
xor xor19(xor_B[18], w3, B[18]);
xor xor20(xor_B[19], w3, B[19]);
xor xor21(xor_B[20], w3, B[20]);
xor xor22(xor_B[21], w3, B[21]);
xor xor23(xor_B[22], w3, B[22]);
xor xor24(xor_B[23], w3, B[23]);
xor xor25(xor_B[24], w3, B[24]);
xor xor26(xor_B[25], w3, B[25]);
xor xor27(xor_B[26], w3, B[26]);
xor xor28(xor_B[27], w3, B[27]);
xor xor29(xor_B[28], w3, B[28]);
xor xor30(xor_B[29], w3, B[29]);
xor xor31(xor_B[30], w3, B[30]);
xor xor32(xor_B[31], w3, B[31]);


design_p_and_g p_and_g(.A(A), .B(xor_B), .G1(g), .P1(p), .G2(G), .P2(P));

cla_32_bit cla_32_bit_1(.G(G), .P(P), .carryIn(w3), .C(C));

cla_4_bit cla_4_bit_1(.G(g[3:0]), .P(p[3:0]), .carryIn(w3), .C(c[2:0]));
adder_1_bit adder_1_bit_1(.A(A[0]), .B(xor_B[0]), .carryIn(w3), .R(R[0]));
adder_1_bit adder_1_bit_2(.A(A[1]), .B(xor_B[1]), .carryIn(c[0]), .R(R[1]));
adder_1_bit adder_1_bit_3(.A(A[2]), .B(xor_B[2]), .carryIn(c[1]), .R(R[2]));
adder_1_bit adder_1_bit_4(.A(A[3]), .B(xor_B[3]), .carryIn(c[2]), .R(R[3]));

cla_4_bit cla_4_bit_2(.G(g[7:4]), .P(p[7:4]), .carryIn(C[0]), .C(c[6:4]));
adder_1_bit adder_1_bit_5(.A(A[4]), .B(xor_B[4]), .carryIn(C[0]), .R(R[4]));//Big C in carryIn
adder_1_bit adder_1_bit_6(.A(A[5]), .B(xor_B[5]), .carryIn(c[4]), .R(R[5]));
adder_1_bit adder_1_bit_7(.A(A[6]), .B(xor_B[6]), .carryIn(c[5]), .R(R[6]));
adder_1_bit adder_1_bit_8(.A(A[7]), .B(xor_B[7]), .carryIn(c[6]), .R(R[7]));

cla_4_bit cla_4_bit_3(.G(g[11:8]), .P(p[11:8]), .carryIn(C[1]), .C(c[10:8]));
adder_1_bit adder_1_bit_9(.A(A[8]), .B(xor_B[8]), .carryIn(C[1]), .R(R[8]));//Big C in carryIn
adder_1_bit adder_1_bit_10(.A(A[9]), .B(xor_B[9]), .carryIn(c[8]), .R(R[9]));
adder_1_bit adder_1_bit_11(.A(A[10]), .B(xor_B[10]), .carryIn(c[9]), .R(R[10]));
adder_1_bit adder_1_bit_12(.A(A[11]), .B(xor_B[11]), .carryIn(c[10]), .R(R[11]));

cla_4_bit cla_4_bit_4(.G(g[15:12]), .P(p[15:12]), .carryIn(C[2]), .C(c[14:12]));
adder_1_bit adder_1_bit_13(.A(A[12]), .B(xor_B[12]), .carryIn(C[2]), .R(R[12]));//Big C in carryIn
adder_1_bit adder_1_bit_14(.A(A[13]), .B(xor_B[13]), .carryIn(c[12]), .R(R[13]));
adder_1_bit adder_1_bit_15(.A(A[14]), .B(xor_B[14]), .carryIn(c[13]), .R(R[14]));
adder_1_bit adder_1_bit_16(.A(A[15]), .B(xor_B[15]), .carryIn(c[14]), .R(R[15]));

cla_4_bit cla_4_bit_5(.G(g[19:16]), .P(p[19:16]), .carryIn(C[3]), .C(c[18:16]));
adder_1_bit adder_1_bit_17(.A(A[16]), .B(xor_B[16]), .carryIn(C[3]), .R(R[16]));//Big C in carryIn
adder_1_bit adder_1_bit_18(.A(A[17]), .B(xor_B[17]), .carryIn(c[16]), .R(R[17]));
adder_1_bit adder_1_bit_19(.A(A[18]), .B(xor_B[18]), .carryIn(c[17]), .R(R[18]));
adder_1_bit adder_1_bit_20(.A(A[19]), .B(xor_B[19]), .carryIn(c[18]), .R(R[19]));

cla_4_bit cla_4_bit_6(.G(g[23:20]), .P(p[23:20]), .carryIn(C[4]), .C(c[22:20]));
adder_1_bit adder_1_bit_21(.A(A[20]), .B(xor_B[20]), .carryIn(C[4]), .R(R[20]));//Big C in carryIn
adder_1_bit adder_1_bit_22(.A(A[21]), .B(xor_B[21]), .carryIn(c[20]), .R(R[21]));
adder_1_bit adder_1_bit_23(.A(A[22]), .B(xor_B[22]), .carryIn(c[21]), .R(R[22]));
adder_1_bit adder_1_bit_24(.A(A[23]), .B(xor_B[23]), .carryIn(c[22]), .R(R[23]));

cla_4_bit cla_4_bit_7(.G(g[27:24]), .P(p[27:24]), .carryIn(C[5]), .C(c[26:24]));
adder_1_bit adder_1_bit_25(.A(A[24]), .B(xor_B[24]), .carryIn(C[5]), .R(R[24]));//Big C in carryIn
adder_1_bit adder_1_bit_26(.A(A[25]), .B(xor_B[25]), .carryIn(c[24]), .R(R[25]));
adder_1_bit adder_1_bit_27(.A(A[26]), .B(xor_B[26]), .carryIn(c[25]), .R(R[26]));
adder_1_bit adder_1_bit_28(.A(A[27]), .B(xor_B[27]), .carryIn(c[26]), .R(R[27]));

cla_4_bit cla_4_bit_8(.G(g[31:28]), .P(p[31:28]), .carryIn(C[6]), .C(c[30:28]));
adder_1_bit adder_1_bit_29(.A(A[28]), .B(xor_B[28]), .carryIn(C[6]), .R(R[28]));//Big C in carryIn
adder_1_bit adder_1_bit_30(.A(A[29]), .B(xor_B[29]), .carryIn(c[28]), .R(R[29]));
adder_1_bit adder_1_bit_31(.A(A[30]), .B(xor_B[30]), .carryIn(c[29]), .R(R[30]));
adder_1_bit adder_1_bit_32(.A(A[31]), .B(xor_B[31]), .carryIn(c[30]), .R(R[31]));

xor xor33(w4, C[7], c[30]);
xor xor34(temp[0], w4, R[31]); //When calculating less_than, I set temp[0] to 1 or 0. And I fill the most significant bits that I will give to the output with 0.

//alu_op[2] is always 1 so I used this. Whole most significant bits will be 0.
not not1(temp[1], alu_op[2]);
not not2(temp[2], alu_op[2]);
not not3(temp[3], alu_op[2]);
not not4(temp[4], alu_op[2]);
not not5(temp[5], alu_op[2]);
not not6(temp[6], alu_op[2]);
not not7(temp[7], alu_op[2]);
not not8(temp[8], alu_op[2]);
not not9(temp[9], alu_op[2]);
not not10(temp[10], alu_op[2]);
not not11(temp[11], alu_op[2]);
not not12(temp[12], alu_op[2]);
not not13(temp[13], alu_op[2]);
not not14(temp[14], alu_op[2]);
not not15(temp[15], alu_op[2]);
not not16(temp[16], alu_op[2]);
not not17(temp[17], alu_op[2]);
not not18(temp[18], alu_op[2]);
not not19(temp[19], alu_op[2]);
not not20(temp[20], alu_op[2]);
not not21(temp[21], alu_op[2]);
not not22(temp[22], alu_op[2]);
not not23(temp[23], alu_op[2]);
not not24(temp[24], alu_op[2]);
not not25(temp[25], alu_op[2]);
not not26(temp[26], alu_op[2]);
not not27(temp[27], alu_op[2]);
not not28(temp[28], alu_op[2]);
not not29(temp[29], alu_op[2]);
not not30(temp[30], alu_op[2]);
not not31(temp[31], alu_op[2]);

or or2(w5, alu_op[0], alu_op[1]); // w5 becomes 0 when less_than operation is performed directly

mux2x1_32bit mux1(Result, temp, R, w5); // When w5 is 0, it gives temp to the output, when w5 is 1, it gives R to the output.

endmodule
