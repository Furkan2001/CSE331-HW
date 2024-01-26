module mux8x1_1bit (output R, input in1, in2, in3, in4, in5, in6, in7, in8, input [2:0] selection);

	wire [2:0] selection_not;
	wire w1, w2, w3, w4, w5, w6, w7, w8;
	
	not not1(selection_not[0], selection[0]);
	not not2(selection_not[1], selection[1]);
	not not3(selection_not[2], selection[2]);
	
	and and1(w1, in1, selection_not[2], selection_not[1], selection_not[0]);
	and and2(w2, in2, selection_not[2], selection_not[1], selection[0]);
	and and3(w3, in3, selection_not[2], selection[1], selection_not[0]);
	and and4(w4, in4, selection_not[2], selection[1], selection[0]);
	and and5(w5, in5, selection[2], selection_not[1], selection_not[0]);
	and and6(w6, in6, selection[2], selection_not[1], selection[0]);
	and and7(w7, in7, selection[2], selection[1], selection_not[0]);
	and and8(w8, in8, selection[2], selection[1], selection[0]);
	
	or or1(R, w1, w2, w3, w4, w5, w6, w7, w8);

endmodule
