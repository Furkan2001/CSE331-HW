module mod_cu (
	input clk,
	input reset,
	input less_than, 
	output reg write_temp, 
	output reg write_result
);

reg [1:0] curr_state, next_state;

localparam 	START 	= 2'b00,
				SUB		= 2'b01,
				END 		= 2'b10;
				
// state register
always @ (posedge clk) begin
	if(reset)
		curr_state <= START;
	else
		curr_state <= next_state;
end


// next_state register
always @ (*) begin
	if(!reset) begin
		case (curr_state)
			START:  next_state = SUB;
			SUB: begin
					if (less_than)
						next_state = END;
					else
						next_state = SUB;
			end
			END:	begin
					end
		endcase
	end
	else begin
		next_state = START; // Default case
	end
end



// output 
always @ (*) begin
	case (curr_state)
		START: 	begin
						write_temp = 1'b1;
						write_result = 1'b0;
					end
		SUB:	   begin
						write_temp = 1'b0;
						write_result = 1'b1;
					end
		
		END: 		begin
						write_temp = 1'b0;
						write_result = 1'b1;
					end
		default: begin
						write_temp = 1'b0;
						write_result = 1'b0;
					end
	endcase
end
	
endmodule