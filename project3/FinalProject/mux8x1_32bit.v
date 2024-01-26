module mux8x1_32bit (output [31:0] out, input [31:0] in1, in2, in3, in4, in5, in6, in7, in8, input [2:0] selection);

	mux8x1_1bit mux1(out[0], in1[0], in2[0], in3[0], in4[0], in5[0], in6[0], in7[0], in8[0], selection);
	mux8x1_1bit mux2(out[1], in1[1], in2[1], in3[1], in4[1], in5[1], in6[1], in7[1], in8[1], selection);
	mux8x1_1bit mux3(out[2], in1[2], in2[2], in3[2], in4[2], in5[2], in6[2], in7[2], in8[2], selection);
	mux8x1_1bit mux4(out[3], in1[3], in2[3], in3[3], in4[3], in5[3], in6[3], in7[3], in8[3], selection);
	mux8x1_1bit mux5(out[4], in1[4], in2[4], in3[4], in4[4], in5[4], in6[4], in7[4], in8[4], selection);
	mux8x1_1bit mux6(out[5], in1[5], in2[5], in3[5], in4[5], in5[5], in6[5], in7[5], in8[5], selection);
	mux8x1_1bit mux7(out[6], in1[6], in2[6], in3[6], in4[6], in5[6], in6[6], in7[6], in8[6], selection);
	mux8x1_1bit mux8(out[7], in1[7], in2[7], in3[7], in4[7], in5[7], in6[7], in7[7], in8[7], selection);
	mux8x1_1bit mux9(out[8], in1[8], in2[8], in3[8], in4[8], in5[8], in6[8], in7[8], in8[8], selection);
	mux8x1_1bit mux10(out[9], in1[9], in2[9], in3[9], in4[9], in5[9], in6[9], in7[9], in8[9], selection);
	mux8x1_1bit mux11(out[10], in1[10], in2[10], in3[10], in4[10], in5[10], in6[10], in7[10], in8[10], selection);
	mux8x1_1bit mux12(out[11], in1[11], in2[11], in3[11], in4[11], in5[11], in6[11], in7[11], in8[11], selection);
	mux8x1_1bit mux13(out[12], in1[12], in2[12], in3[12], in4[12], in5[12], in6[12], in7[12], in8[12], selection);
	mux8x1_1bit mux14(out[13], in1[13], in2[13], in3[13], in4[13], in5[13], in6[13], in7[13], in8[13], selection);
	mux8x1_1bit mux15(out[14], in1[14], in2[14], in3[14], in4[14], in5[14], in6[14], in7[14], in8[14], selection);
	mux8x1_1bit mux16(out[15], in1[15], in2[15], in3[15], in4[15], in5[15], in6[15], in7[15], in8[15], selection);
	mux8x1_1bit mux17(out[16], in1[16], in2[16], in3[16], in4[16], in5[16], in6[16], in7[16], in8[16], selection);
	mux8x1_1bit mux18(out[17], in1[17], in2[17], in3[17], in4[17], in5[17], in6[17], in7[17], in8[17], selection);
	mux8x1_1bit mux19(out[18], in1[18], in2[18], in3[18], in4[18], in5[18], in6[18], in7[18], in8[18], selection);
	mux8x1_1bit mux20(out[19], in1[19], in2[19], in3[19], in4[19], in5[19], in6[19], in7[19], in8[19], selection);
	mux8x1_1bit mux21(out[20], in1[20], in2[20], in3[20], in4[20], in5[20], in6[20], in7[20], in8[20], selection);
	mux8x1_1bit mux22(out[21], in1[21], in2[21], in3[21], in4[21], in5[21], in6[21], in7[21], in8[21], selection);
	mux8x1_1bit mux23(out[22], in1[22], in2[22], in3[22], in4[22], in5[22], in6[22], in7[22], in8[22], selection);
	mux8x1_1bit mux24(out[23], in1[23], in2[23], in3[23], in4[23], in5[23], in6[23], in7[23], in8[23], selection);
	mux8x1_1bit mux25(out[24], in1[24], in2[24], in3[24], in4[24], in5[24], in6[24], in7[24], in8[24], selection);
	mux8x1_1bit mux26(out[25], in1[25], in2[25], in3[25], in4[25], in5[25], in6[25], in7[25], in8[25], selection);
	mux8x1_1bit mux27(out[26], in1[26], in2[26], in3[26], in4[26], in5[26], in6[26], in7[26], in8[26], selection);
	mux8x1_1bit mux28(out[27], in1[27], in2[27], in3[27], in4[27], in5[27], in6[27], in7[27], in8[27], selection);
	mux8x1_1bit mux29(out[28], in1[28], in2[28], in3[28], in4[28], in5[28], in6[28], in7[28], in8[28], selection);
	mux8x1_1bit mux30(out[29], in1[29], in2[29], in3[29], in4[29], in5[29], in6[29], in7[29], in8[29], selection);
	mux8x1_1bit mux31(out[30], in1[30], in2[30], in3[30], in4[30], in5[30], in6[30], in7[30], in8[30], selection);
	mux8x1_1bit mux32(out[31], in1[31], in2[31], in3[31], in4[31], in5[31], in6[31], in7[31], in8[31], selection);

endmodule
