module my_testbench();

	 reg clock;

    // Instantiate the MIPS module
    mips uut(
        .clock(clock)
    );

    integer count;

    initial begin
        clock = 1'b1;
        count = 0;

        // Main simulation loop
        while (count < 1000) begin
            #100 clock = ~clock;
            count = count + 1;
        end

        // Stop simulation
        $stop;
    end


//	reg [31:0] in1;
//	reg [4:0] a1;
//	reg [4:0] a2;
//	reg [4:0] a3;
	//reg regWrite;
	//reg byteOperations;
//	reg [2:0] ALUop;
//	reg [5:0] function_code;
//	reg [17:0] address;
	//reg memRead;
	//reg memWrite;
	
//	wire [31:0] out1;
//	wire [31:0] out2;
//	wire [2:0] alu_ctr;
//	wire regDst;
//	wire branch;
//	wire memRead;
//	wire memWrite;
//	wire ALUsrc;
//	wire regWrite;
//	wire jump;
//	wire byteOperations;
//	wire move;
	
	//register_block alu (.write_data(in1), .read_reg1(a1), .read_reg2(a2), .write_reg(a3), .regWrite(regWrite), .byteOperations(byteOperations), .read_data1(out1), .read_data2(out2));
	//alu_control alu (.ALUop(ALUop), .function_code(function_code), .alu_ctr(alu_ctr));
	//memory_block mb1(.read_data(out1), .byteOperations(byteOperations), .address(address), .write_data(in1), .memRead(memRead), .memWrite(memWrite));
	//control_unit cu(.regDst(regDst), .branch(branch), .memRead(memRead), .memWrite(memWrite), .ALUsrc(ALUsrc), .regWrite(regWrite), .jump(jump), .byteOperations(byteOperations), .move(move), .ALUop(alu_ctr), .opcode(function_code));
	
//	initial begin
	//	#5 in1 = 32'b11000000000000000000000000000011; a1 = 5'b00000; a2 = 5'b00001; a3 = 5'b00000; regWrite = 1'b1; byteOperations = 1'b0;
	//	#5 $display ("out1 = %b      out2 = %b", out1, out2);
	//	#5 in1 = 32'b00000000000000000000000000000000; a1 = 5'b00011; a2 = 5'b00111; a3 = 5'b00001; regWrite = 1'b0; byteOperations = 1'b0;
	//	#5 $display ("out1 = %b      out2 = %b", out1, out2);
	//	#5 in1 = 32'b11100000000000000000000010000111; a1 = 5'b00001; a2 = 5'b00011; a3 = 5'b00011; regWrite = 1'b1; byteOperations = 1'b1;
	//	#5 $display ("out1 = %b      out2 = %b", out1, out2);
	//	#5 in1 = 32'b11100000000000000000000000111111; a1 = 5'b00011; a2 = 5'b00001; a3 = 5'b00111; regWrite = 1'b1; byteOperations = 1'b1;
	//	#5 $display ("out1 = %b      out2 = %b", out1, out2);
	//	#5 ALUop = 3'b111; function_code = 6'b000010;
	//	#5 $display ("out1 = %b", alu_ctr);
	//	#5 ALUop = 3'b111; function_code = 6'b000011;
	//	#5 $display ("out1 = %b", alu_ctr);
	//	#5 ALUop = 3'b111; function_code = 6'b000111;
	//	#5 $display ("out1 = %b", alu_ctr);
	//	#5 ALUop = 3'b111; function_code = 6'b001000;
	//	#5 $display ("out1 = %b", alu_ctr);
	//	#5 ALUop = 3'b111; function_code = 6'b000111;
	//	#5 $display ("out1 = %b", alu_ctr);
	//	#5 in1 = 32'b11000000000000000000000000000011; address = 18'b000000000000000011; byteOperations = 1'b1; memRead = 1'b0; memWrite = 1'b1;
	//	#5 $display ("out1 = %b", out1);
	//	#5 in1 = 32'b11000000000000000000000000000011; address = 18'b000000000000000011; byteOperations = 1'b1; memRead = 1'b1; memWrite = 1'b0;
	//	#5 $display ("out1 = %b", out1);
	//	#5 in1 = 32'b11000000000000000000000000000011; address = 18'b000000000000001000; byteOperations = 1'b0; memRead = 1'b0; memWrite = 1'b1;
	//	#5 $display ("out1 = %b", out1);
	//	#5 in1 = 32'b11000000000000000000000000000011; address = 18'b000000000000001000; byteOperations = 1'b0; memRead = 1'b1; memWrite = 1'b0;
	//	#5 $display ("out1 = %b", out1);
	//	#5 in1 = 32'b11000000000000000000000000000011; address = 18'b000000000000001000; byteOperations = 1'b1; memRead = 1'b1; memWrite = 1'b0;
	//	#5 $display ("out1 = %b", out1);
//		#5 function_code = 6'b000000;
//		#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
//		#5 function_code = 6'b000011;
//		#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
//		#5 function_code = 6'b000100;
//		#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
//		#5 function_code = 6'b000101;
//		#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
//		#5 function_code = 6'b000010;
//		#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
//		#5 function_code = 6'b001000;
//		#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
//		#5 function_code = 6'b010000;
//			#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
//			#5 function_code = 6'b010001;
//			#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
//			#5 function_code = 6'b001001;
//		#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
//			#5 function_code = 6'b000111;
//			#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
//			#5 function_code = 6'b100011;
//			#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
//			#5 function_code = 6'b100111;
//			#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
//			#5 function_code = 6'b111000;
//			#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
	//		#5 function_code = 6'b111001;
//			#5 $display ("regDst = %b    branch = %b    memRead = %b    memWrite = %b    ALUsrc = %b    regWrite = %b    jump = %b    byteOperations = %b   move = %b    ALUop = %b", regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, alu_ctr);
//		end

endmodule
