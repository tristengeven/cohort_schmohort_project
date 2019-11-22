/*
	Selector Unit
		- Selects the next state to go to based on the values of rst, error, and opcode
		- Returns a 1-hot value
*/

// 3 bit opcodes
`define ADD 			3'b000
`define SUB 			3'b001
`define MULT 			3'b010
`define SHIFT_LEFT		3'b011
`define AND 			3'b100
`define OR	 			3'b101
`define XOR		 		3'b110
`define NOT	 			3'b111

module Selector(input [2:0] opcode, input rst, error, output reg [9:0] out);
	always@(*) begin
			out <=  (rst 					? 10'b0100000000:
					(error 					? (opcode == `ADD ? 
											  10'b0000000001: 
											  10'b0000000010):
					(opcode == `ADD 		? 10'b0000000001:
					(opcode == `SUB 		? 10'b0000000010:
					(opcode == `MULT 		? 10'b0000000100:
					(opcode == `SHIFT_LEFT	? 10'b0000001000:
					(opcode == `AND			? 10'b0000010000:
					(opcode == `OR		    ? 10'b0000100000:
					(opcode == `XOR			? 10'b0001000000:
					(opcode == `NOT			? 10'b0010000000: 
											  10'b0000000000))))))))));
	end
endmodule