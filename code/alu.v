`include "and.v"
`include "simpleand.v"
`include "mult.v"
`include "shiftl.v"
`include "or.v"
`include "xor.v"
`include "not.v"
`include "add_subtract.v"
`include "dff.v"
`include "mux.v"
`include "selector.v"

module ALU(input clk, rst, input [15:0] A, B, input [2:0] opcode, output [15:0] out, output reg status);
	parameter bits = 16;
	
	wire [bits-1:0] next_state;
	wire op_complete, prev_out, error;
	wire [bits-1:0] opA;
	
	// checks if first op is completed
	DFF_1 dff_1(clk, ~rst, op_complete);

	// selects original input or last output based on prev_out value
	SIMPLE_AND and1((^op_complete === 1'bx ? 1'b0: op_complete), ~rst, prev_out);

	// set next state value to current state at the positive edge of clk
	DFF_16 dff_16(clk, next_state, out);
	
	// selects output if op was done
	Mux2 in(A, out, prev_out, opA);
	
	wire unsigned [bits-1:0] add, sub;
	wire unsigned add_carry, sub_carry;
	wire unsigned overflow;
	reg M0 = 0;
	reg M1 = 1;
	
	// sets values based on mode
	Adder_16bit adder(opA, B, M0, add_carry, add);
	Adder_16bit subtractor(opA, B, M1, sub_carry, sub);
	
	// wires for other operations
	wire [bits-1:0] mult_op;
	wire [bits-1:0] shiftl_op;
	wire [bits-1:0] and_op;
	wire [bits-1:0] or_op;
	wire [bits-1:0] xor_op;
	wire [bits-1:0] not_op;
	
	// generate behavioral values
	MULT mult1(opA, B, mult_op, overflow);
	SHIFTL shiftl1(opA, B, shiftl_op);
	AND and2(opA, B, and_op);
	OR or1(opA, B, or_op);
	XOR xor1(opA, B, xor_op);
	NOT not1(opA, not_op);

	// selects 1-hot select from opcode, rst, and error state
	wire [9:0] s;
	Selector select(opcode, rst, error, s);
	
	// select next state from opcode
	Mux10 nextState(16'b0000000000000000, add, sub, mult_op, shiftl_op, and_op, or_op, xor_op, not_op, out, s, next_state);
	
	// assign error based on carry or overflow
	assign error =  ((opcode == `ADD && add_carry == 1'b1) ? add_carry:
					 (opcode == `SUB && sub_carry == 1'b1) ? sub_carry:
					 (opcode == `MULT && overflow == 1'b1) ? overflow: 1'b0);
	
	always @(posedge clk) begin
		status <= error;
	end

endmodule