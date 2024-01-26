module memory_block (output reg [31:0] read_data, input byteOperations, input [17:0] address, input [31:0] write_data, input memRead, input memWrite);

	reg [7:0] memory [255:0];

	 always @(*) begin
	 
		  $readmemb("memory.mem", memory);
	 
			if (memWrite) begin
            if (byteOperations) begin
                memory[address[7:0]] = write_data[7:0];
            end else begin
                memory[address[7:0]] = write_data[7:0];
                memory[address[7:0]+1] = write_data[15:8];
                memory[address[7:0]+2] = write_data[23:16];
                memory[address[7:0]+3] = write_data[31:24];
            end
				$writememb("memory.mem", memory);
        end
		  
		  $readmemb("memory.mem", memory);
	 
        if (memRead) begin
            if (byteOperations) begin
                read_data = {24'b0, memory[address[7:0]]};
            end else begin
                read_data = {memory[address[7:0]+3], memory[address[7:0]+2], memory[address[7:0]+1], memory[address[7:0]]};
            end
        end
    end

endmodule
