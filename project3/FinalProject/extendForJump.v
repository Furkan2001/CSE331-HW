module extendForJump (input [25:0] jumpAdd, input [3:0] pcFirst4, output [31:0] out);

	not not1 (out[0], 1'b1);
	not not2 (out[1], 1'b1);
	and and1 (out[2], jumpAdd[0], 1'b1);
	and and2 (out[3], jumpAdd[1], 1'b1);
	and and3 (out[4], jumpAdd[2], 1'b1);
	and and4 (out[5], jumpAdd[3], 1'b1);
	and and5 (out[6], jumpAdd[4], 1'b1);
	and and6 (out[7], jumpAdd[5], 1'b1);
	and and7 (out[8], jumpAdd[6], 1'b1);
	and and8 (out[9], jumpAdd[7], 1'b1);
	and and9 (out[10], jumpAdd[8], 1'b1);
	and and10 (out[11], jumpAdd[9], 1'b1);
	and and11 (out[12], jumpAdd[10], 1'b1);
	and and12 (out[13], jumpAdd[11], 1'b1);
	and and13 (out[14], jumpAdd[12], 1'b1);
	and and14 (out[15], jumpAdd[13], 1'b1);
	and and15 (out[16], jumpAdd[14], 1'b1);
	and and16 (out[17], jumpAdd[15], 1'b1);
	and and17 (out[18], jumpAdd[16], 1'b1);
	and and18 (out[19], jumpAdd[17], 1'b1);
	and and19 (out[20], jumpAdd[18], 1'b1);
	and and20 (out[21], jumpAdd[19], 1'b1);
	and and21 (out[22], jumpAdd[20], 1'b1);
	and and22 (out[23], jumpAdd[21], 1'b1);
	and and23 (out[24], jumpAdd[22], 1'b1);
	and and24 (out[25], jumpAdd[23], 1'b1);
	and and25 (out[26], jumpAdd[24], 1'b1);
	and and26 (out[27], jumpAdd[25], 1'b1);
	and and27 (out[28], pcFirst4[0], 1'b1);
	and and28 (out[29], pcFirst4[1], 1'b1);
	and and29 (out[30], pcFirst4[2], 1'b1);
	and and30 (out[31], pcFirst4[3], 1'b1);

endmodule
