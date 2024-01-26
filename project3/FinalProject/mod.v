module mod(
	input [31:0] A,
	input [31:0] B,
	input clk,
	input reset,
	output [31:0] Result
);

	wire isLessThan, writeTemp, writeResult;
	
	mod_cu io(.reset(reset), .clk(clk), .less_than(isLessThan), .write_temp(writeTemp), .write_result(writeResult));
	mod_dp i1(.clk(clk), .A(A), .B(B), .write_temp(writeTemp), .write_result(writeResult), .less_than(isLessThan), .R(Result));



endmodule
