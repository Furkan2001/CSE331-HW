module adder_1_bit (input A, input B, input carryIn, output R);

	xor xor1(R,A,B,carryIn);

endmodule
