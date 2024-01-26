module instruction_block (output reg [31:0] instruction, input [31:0] pc);

	reg [7:0] inst [4095:0];

	always @ (pc) begin

		$readmemb("instructions.mem", inst);
		instruction[31:24] = inst[pc[9:0]];
		instruction[23:16] = inst[pc[9:0]+1];
		instruction[15:8] = inst[pc[9:0]+2];
		instruction[7:0] = inst[pc[9:0]+3];

	end


endmodule
