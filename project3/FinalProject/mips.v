module mips (input clock);
	
	reg [31:0] pc = 32'b00000000000000000000000000000000;
	wire [31:0] instruction;
	wire [31:0] pc_4, writeData, readData1, readData2, sign_ext_imm, tempShift, addAluResult, aluInputTemp, aluResult, read_data, jOutput, realWriteRegister, realWriteData;
	wire regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, zero, resultOfAnd, jumpOrJumpAndLink, beq, bne, t1, t2, t3, notZero;
	wire [2:0] ALUop, alu_ctr;
	wire [4:0] writeRegister;
	wire [5:0] opcode_not;
	
		instruction_block instructionMemory(.pc(pc), .instruction(instruction));
		
		my_add add1(.A(pc), .B(32'b00000000000000000000000000000100), .alu_op(3'b101), .Result(pc_4));  //pc arttırma işlemi devam edecek şuan sadece 4 ile topladım.
		
		control_unit controlUnit(.regDst(regDst), .branch(branch), .memRead(memRead), .memWrite(memWrite), .ALUsrc(ALUsrc), .regWrite(regWrite), .jump(jump), .byteOperations(byteOperations), .move(move), .ALUop(ALUop), .opcode(instruction[31:26]));
		
		and and999 (jumpOrJumpAndLink, jump, instruction[26]);
		
		mux2x1_1bit mux1(.out(writeRegister[0]), .in1(instruction[16]), .in2(instruction[11]), .selection(regDst));
		mux2x1_1bit mux2(.out(writeRegister[1]), .in1(instruction[17]), .in2(instruction[12]), .selection(regDst));
		mux2x1_1bit mux3(.out(writeRegister[2]), .in1(instruction[18]), .in2(instruction[13]), .selection(regDst));
		mux2x1_1bit mux4(.out(writeRegister[3]), .in1(instruction[19]), .in2(instruction[14]), .selection(regDst));
		mux2x1_1bit mux5(.out(writeRegister[4]), .in1(instruction[20]), .in2(instruction[15]), .selection(regDst));

		extendForJump forJump(instruction[25:0], pc[31:28], jOutput);
		
		register_block registerBlock(.write_data(writeData), .read_reg1(instruction[25:21]), .read_reg2(instruction[20:16]), .write_reg(writeRegister), .regWrite(regWrite), .byteOperations(byteOperations), .read_data1(readData1), .read_data2(readData2));

		sign_extend signExtend(.imm(instruction[15:0]), .sign_ext_imm(sign_ext_imm));
		
		shift_left_2 shiftLeft2(.shifted_address(tempShift), .address(sign_ext_imm));
	
		my_add add2(.A(tempShift), .B(pc_4), .alu_op(3'b101), .Result(addAluResult));
		
		mux2x1_32bit mux6(.out(aluInputTemp), .in1(readData2), .in2(sign_ext_imm), .selection(ALUsrc));
	
		alu_control aluControl(.ALUop(ALUop), .function_code(instruction[5:0]), .alu_ctr(alu_ctr));
		
		my_alu myAlu(.alu_result(aluResult), .zero_bit(zero), .alu_src1(readData1), .alu_src2(aluInputTemp), .alu_ctr(alu_ctr));
	
		memory_block memoryBlock(.read_data(read_data), .byteOperations(byteOperations), .address(aluResult[17:0]), .write_data(readData2), .memRead(memRead), .memWrite(memWrite));
		
		//mux2x1_32bit mux93(.out(realWriteData), .in1(writeData), .in2(pc_4), .selection(jumpOrJumpAndLink));
		//mux2x1_32bit mux94(.out(realWriteRegister), .in1(writeRegister), .in2(5'b11111), .selection(jumpOrJumpAndLink));
		
		register_block registerBlock2(.write_data(writeData), .read_reg1(instruction[25:21]), .read_reg2(instruction[20:16]), .write_reg(writeRegister), .regWrite(regWrite), .byteOperations(byteOperations), .read_data1(readData1), .read_data2(readData2));
		
		mux2x1_32bit mux7(.out(writeData), .in1(aluResult), .in2(read_data), .selection(memRead));
		
		not nott1 (opcode_not[5], instruction[31]);
		not nott2 (opcode_not[4], instruction[30]);
		not nott3 (opcode_not[3], instruction[29]);
		not nott4 (opcode_not[2], instruction[28]);
		not nott5 (opcode_not[1], instruction[27]);
		not nott6 (opcode_not[0], instruction[26]);
		not nott7 (notZero, zero);
		
		// BEQ -> OPCODE 100011
		and is_beq(beq, instruction[31], opcode_not[4], opcode_not[3], opcode_not[2], instruction[27], instruction[26]);
		
		// BNE -> OPCODE 100111
		and is_bne(bne, instruction[31], opcode_not[4], opcode_not[3], instruction[28], instruction[27], instruction[26]);
		
		and andd1 (t1, beq, zero);
		and andd2 (t2, bne, notZero);
		or orr1 (t3, t1, t2);
		
		and and94(resultOfAnd, branch, t3);
		
		//mux2x1_32bit mux8(.out(pc), .in1(pc_4), .in2(addAluResult), .selection(resultOfAnd));
		always @ (posedge clock) begin
			$display("pc= %b    instruction = %b  regDst= %b, branch= %b, memRead= %b, memWrite= %b, ALUsrc= %b, regWrite= %b, jump= %b, byteOperations= %b, move= %b, zero= %b, resultOfAnd= %b   t3= %b   t2= %b   t1= %b", pc, instruction, regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, zero, resultOfAnd, t3, t2, t1);
			if (jump) begin
				pc <= jOutput;
			end else begin
				case(resultOfAnd)
				1'b0: pc <= pc_4;
				1'b1: pc <= addAluResult;
				endcase
			end
		end


endmodule
