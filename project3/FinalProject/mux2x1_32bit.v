module mux2x1_32bit (output [31:0] out, input [31:0] in1, in2, input selection);

	mux2x1_1bit mux1(out[0], in1[0], in2[0], selection);
	mux2x1_1bit mux2(out[1], in1[1], in2[1], selection);
	mux2x1_1bit mux3(out[2], in1[2], in2[2], selection);
	mux2x1_1bit mux4(out[3], in1[3], in2[3], selection);
	mux2x1_1bit mux5(out[4], in1[4], in2[4], selection);
	mux2x1_1bit mux6(out[5], in1[5], in2[5], selection);
	mux2x1_1bit mux7(out[6], in1[6], in2[6], selection);
	mux2x1_1bit mux8(out[7], in1[7], in2[7], selection);
	mux2x1_1bit mux9(out[8], in1[8], in2[8], selection);
	mux2x1_1bit mux10(out[9], in1[9], in2[9], selection);
	mux2x1_1bit mux11(out[10], in1[10], in2[10], selection);
	mux2x1_1bit mux12(out[11], in1[11], in2[11], selection);
	mux2x1_1bit mux13(out[12], in1[12], in2[12], selection);
	mux2x1_1bit mux14(out[13], in1[13], in2[13], selection);
	mux2x1_1bit mux15(out[14], in1[14], in2[14], selection);
	mux2x1_1bit mux16(out[15], in1[15], in2[15], selection);
	mux2x1_1bit mux17(out[16], in1[16], in2[16], selection);
	mux2x1_1bit mux18(out[17], in1[17], in2[17], selection);
	mux2x1_1bit mux19(out[18], in1[18], in2[18], selection);
	mux2x1_1bit mux20(out[19], in1[19], in2[19], selection);
	mux2x1_1bit mux21(out[20], in1[20], in2[20], selection);
	mux2x1_1bit mux22(out[21], in1[21], in2[21], selection);
	mux2x1_1bit mux23(out[22], in1[22], in2[22], selection);
	mux2x1_1bit mux24(out[23], in1[23], in2[23], selection);
	mux2x1_1bit mux25(out[24], in1[24], in2[24], selection);
	mux2x1_1bit mux26(out[25], in1[25], in2[25], selection);
	mux2x1_1bit mux27(out[26], in1[26], in2[26], selection);
	mux2x1_1bit mux28(out[27], in1[27], in2[27], selection);
	mux2x1_1bit mux29(out[28], in1[28], in2[28], selection);
	mux2x1_1bit mux30(out[29], in1[29], in2[29], selection);
	mux2x1_1bit mux31(out[30], in1[30], in2[30], selection);
	mux2x1_1bit mux32(out[31], in1[31], in2[31], selection);
	
endmodule
