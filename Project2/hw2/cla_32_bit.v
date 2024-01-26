module cla_32_bit (input [7:0] G, input [7:0] P, input carryIn, output [7:0] C);
	wire x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31, x32, x33, x34, x35;
	
	//c4 = G3:0 + P3:0 . Cin
	and and1(x0, P[0], carryIn);
	or or1(C[0], x0, G[0]); //C4
	
	
	//c8 = G7:4 + P7:4 . c4
	and and2(x1, P[1], P[0], carryIn);
	and and3(x2, G[0], P[1]);
	or or2(C[1], x2, x1, G[1]); //C8
	
	//c12 = G11:8 + P11:8 . c8
	and and4(x3, P[2], G[1]);
	and and5(x4, P[2], P[1], G[0]);
	and and6(x5, P[2], P[1], P[0], carryIn);
	or or3(C[2], x5, x4, x3, G[2]); //C12
	
	//c16 = G15:12 + P15:12 . c12
	and and7(x6, P[3], G[2]);
	and and8(x7, P[3], P[2], G[1]);
	and and9(x8, P[3], P[2], P[1], G[0]);
	and and10(x9, P[3], P[2], P[1], P[0], carryIn);
	or or4(C[3], x9, x8, x7, x6, G[3]);
	
	
	//c20 = G7:4 + P19:16 . c16
	and and11(x10, P[4], G[3]);
	and and12(x11, P[4], P[3], G[2]);
	and and13(x12, P[4], P[3], P[2], G[1]);
	and and14(x13, P[4], P[3], P[2], P[1], G[0]);
	and and15(x14, P[4], P[3], P[2], P[1], carryIn);
	or or5(C[4], x14, x13, x12, x11, x10, G[4]);
	
	//c24 = G11:8 + P23:20 . c20
	and and16(x15, P[5], G[4]);
	and and17(x16, P[5], P[4], G[3]);
	and and18(x17, P[5], P[4], P[3], G[2]);
	and and19(x18, P[5], P[4], P[3], P[2], G[1]);
	and and20(x19, P[5], P[4], P[3], P[2], P[1], G[0]);
	and and21(x20, P[5], P[4], P[3], P[2], P[1], P[0], carryIn);
	or or6(C[5], x20, x19, x18, x17, x16, x15, G[5]);
	
	//c28 = G15:12 + P27:24 . c24
	and and22(x21, P[6], G[5]);
	and and23(x22, P[6], P[5], G[4]);
	and and24(x23, P[6], P[5], P[4], G[3]);
	and and25(x24, P[6], P[5], P[4], P[3], G[2]);
	and and26(x25, P[6], P[5], P[4], P[3], P[2], G[1]);
	and and27(x26, P[6], P[5], P[4], P[3], P[2], P[1], G[0]);
	and and28(x27, P[6], P[5], P[4], P[3], P[2], P[1], P[0], carryIn);
	or or7(C[6], x27, x26, x25, x24, x23, x22, x21, G[6]);
	
	
	//c32 = G7:4 + P31:28 . c28
	and and29(x28, P[7], G[6]);
	and and30(x29, P[7], P[6], G[5]);
	and and31(x30, P[7], P[6], P[5], G[4]);
	and and32(x31, P[7], P[6], P[5], P[4], G[3]);
	and and33(x32, P[7], P[6], P[5], P[4], P[3], G[2]);
	and and34(x33, P[7], P[6], P[5], P[4], P[3], P[2], G[1]);
	and and35(x34, P[7], P[6], P[5], P[4], P[3], P[2], P[1], G[0]);
	and and36(x35, P[7], P[6], P[5], P[4], P[3], P[2], P[1], P[0], carryIn);
	or or8(C[7], x35, x34, x33, x32, x31, x30, x29, x28, G[7]);


endmodule
