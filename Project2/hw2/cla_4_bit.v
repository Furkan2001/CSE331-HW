module cla_4_bit (input [3:0] G, input [3:0] P, input carryIn, output [2:0] C);
	wire X, X0, X1, X2, X3, X4; 
	
	// c1 = g0 + p0c0
	and i0(X, P[0], carryIn);
	or i1(C[0], G[0], X);
	
	
	// c2 = g1 + g0p1 + p1p0c0
	and i2(X0, P[1], P[0], carryIn);
	and i3(X1, G[0], P[1]);
	or i4(C[1], G[1], X1, X0);
	
	
	// c3 = g2 + p2g1 + p2p1g0 + p2p1p0c0
	and i5(X2, P[2], P[1], P[0], carryIn);
	and i6(X3, P[2], P[1], G[0]);
	and i7(X4, P[2], G[1]);
	or i8(C[2], G[2], X2, X3, X4);
	
endmodule
