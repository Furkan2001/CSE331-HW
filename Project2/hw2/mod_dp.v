module mod_dp (
	input clk, 
	input [31:0] A, 
	input [31:0] B, 
	input write_temp, 
	input write_result, 
	output reg less_than, 
	output reg [31:0] R
); 

	reg [31:0] temp = 32'b0;
	
	
	always @(posedge clk) begin
		if (write_temp) begin
			temp <= A;
		end
		if (write_result) begin
			if (temp >= B) begin
				 less_than = 1'b0;
				 temp <= temp - B;
			end
			else begin
				less_than = 1'b1;
				R = temp; 
			end
		end
    end
	 

endmodule
