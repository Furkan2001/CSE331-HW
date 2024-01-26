module mux2x1_1bit (output out, input in1, in2, selection);

	wire selection_not;
	wire w1, w2;
	
	not not1(selection_not, selection);
	
	and and1(w1, in1, selection_not);
	and and2(w2, in2, selection);
	
	or or1(out, w1, w2);

endmodule
