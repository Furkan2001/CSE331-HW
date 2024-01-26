module my_nor (output out, input in1, in2);
	wire temp;

	or or1(temp, in1, in2);
	not not1(out, temp);

endmodule
