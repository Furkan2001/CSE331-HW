module alu_control (input [2:0] ALUop, input [5:0] function_code, output [2:0] alu_ctr);

wire n0,n1,n2,n3,n4,n5;
wire [3:0] r1;
wire t0,t1,t2,t3,t4,t5;

not not1(n0, function_code[0]);
not not2(n1, function_code[1]);
not not3(n2, function_code[2]);
not not4(n3, function_code[3]);
not not5(n4, function_code[4]);
not not6(n5, function_code[5]);

and and1(r1[0], ALUop[0], 1'b1);
and and2(r1[1], ALUop[1], 1'b1);
and and3(r1[2], ALUop[2], 1'b1);

and and6(t0, function_code[1], n0); //add
and and7(t1, function_code[0], n1, function_code[2]); //or
or or1(t2, t0, t1);

and and8(t4, function_code[0], function_code[1], n2); //sub

and and9(t3, function_code[0], function_code[1], function_code[2]); //lessThan
or or2(t5, t4, t0, t3); //sub add lessThan

mux8x1_1bit my_mux1(alu_ctr[0], r1[0], r1[0], r1[0], r1[0], r1[0], r1[0], r1[0], t2, ALUop);
mux8x1_1bit my_mux2(alu_ctr[1], r1[1], r1[1], r1[1], r1[1], r1[1], r1[1], r1[1], t4, ALUop);
mux8x1_1bit my_mux3(alu_ctr[2], r1[2], r1[2], r1[2], r1[2], r1[2], r1[2], r1[2], t5, ALUop);

endmodule
