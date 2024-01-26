module register_block(input [31:0] write_data, input [4:0] read_reg1, read_reg2, write_reg, input regWrite, byteOperations, output reg [31:0] read_data1, read_data2);

	reg [31:0] registers [31:0];
	
	initial begin

		$readmemb("registers.mem", registers);

	end	

    always @ (*) begin
			$readmemb("registers.mem", registers);
	 
        if (regWrite != 0) begin
				if (write_reg != 5'b00000) begin
					if (byteOperations) begin
						case (write_data[7])
							1'b1: registers[write_reg] = {24'b111111111111111111111111, write_data[7:0]};
							1'b0: registers[write_reg] = {24'b000000000000000000000000, write_data[7:0]};
						endcase
						$writememb("registers.mem", registers);
					end else begin
						 registers[write_reg] = write_data;
						 $writememb("registers.mem", registers);
					end
				end
        end
		  
		  $readmemb("registers.mem", registers);
		  
		  if (byteOperations) begin
				case (registers[read_reg1][7])
					1'b1: read_data1 <= {24'b111111111111111111111111, registers[read_reg1][7:0]};
					1'b0: read_data1 <= {24'b000000000000000000000000, registers[read_reg1][7:0]};
				endcase
				case (registers[read_reg2][7])
					1'b1: read_data2 <= {24'b111111111111111111111111, registers[read_reg2][7:0]};
					1'b0: read_data2 <= {24'b000000000000000000000000, registers[read_reg2][7:0]};
				endcase
			end else begin
				read_data1 <= registers[read_reg1];
            read_data2 <= registers[read_reg2];
			end
    end
	 

endmodule
