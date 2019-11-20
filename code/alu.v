`include "add.v"
`include "sub.v"
`include "shiftl.v"
`include "shiftr.v"
`include "and.v"
`include "or.v"
`include "xor.v"
`include "not.v"
`include "nor.v"
`include "xnor.v"
`include "nand.v"
`include "mult.v"


module ALU(funct, A, B, currentState, nextState, accumulator, out, carry, overflow);
	input [3:0] funct;
	input [7:0] A;
	input [7:0] B;
	input [1:0] currentState;

	output [1:0] nextState;
	output [7:0] accumulator;
	output [7:0] out;
	output carry;
	output overflow;

	reg nextState;
	reg accumulator;
	reg out;
	reg carry;
	reg overflow;
	
	// suboperation wires
	wire [7:0] OutAdd;
	wire [7:0] OutSub;
	wire [7:0] OutShiftl;
	wire [7:0] OutShiftr;
	wire [7:0] OutAnd;
	wire [7:0] OutOr;
	wire [7:0] OutXor;
	wire [7:0] OutNot;
	wire [7:0] OutXnor;
	wire [7:0] OutNand;
	wire [7:0] OutNor;
	wire [7:0] OutMult;
	
	// generate subcircuits
	ADD add(A, B, OutAdd, ChkAdd);
	SUB sub(A, B, OutSub, ChkSub);
	MULT mult(A, B, OutMult, ChkMult);
	SHIFTL shiftl(A, B, OutShiftl, Cshiftl);
	SHIFTR shiftr(A, B, OutShiftr, Cshiftr);
	AND andl(A, B, OutAnd);
	OR orl(A, B, OutOr);
	XOR xorl(A, B, OutXor);
	NOT notl(A, OutNot);
	NAND nandl(A, B, OutNand);
	NOR norl(A, B, OutNor);
	XNOR xnorl(A, B, OutXnor);
	
	always @(*) begin
		//Functions as a MUX for results
		case(funct)
			0:begin						// arithmetic op addition
				if(currentState == 0)	// ready state
					out = OutAdd;			
					overflow = ChkAdd;
					nextState = 1;		// arithmetic unit state
				if(overflow == 0)		// op done
					accumulator = OutAdd;
					nextState = 0;		// ready state
				if(overflow != 0)		// error triggered
					nextState = 3;		// error state
			end
			1:begin 					// arithmetic op subtraction
				if(currentState == 0)	// ready state
					out = OutSub;
					overflow = ChkSub;
					nextState = 1;		// arithmetic unit state
				if(overflow == 0)		// op done
					accumulator = OutSub;
					nextState = 0;		// ready state				
				if(overflow != 0)		// error triggered
					nextState = 3;		// error state
			end
			2:begin 					// arithmetic op shift left
				if(currentState == 0)	// ready state
					out = OutShiftl;
					carry = Cshiftl;
					nextState = 1;		// arithmetic unit state
				if(carry == 0)			// op done
					accumulator = OutShiftl;
					nextState = 0;		// ready state
				if(carry != 0)			// error triggered
					nextState = 3;		// error state
			end
			3:begin 					// arithmetic op shift right
				if (currentState == 0)	// ready state
					out = OutShiftr;
					carry = Cshiftr;
					nextState = 1;		// arithmetic unit state
				if(carry == 0)			// op done
					accumulator = OutShiftr;
					nextState = 0;		// ready state
				if(carry != 0)			// error triggered
					nextState = 3;		// error state

			end
			4:begin 						// logic op and
				if (currentState == 0)		// ready state
					out = OutAnd;
					accumulator = OutAnd;
					nextState = 2;			// logic unit state
											// op done
					nextState = 0;			// ready state
			end
			5:begin	 						// logic op or
				if (currentState == 0)		// ready state
					out = OutOr;
					accumulator = OutOr;
					nextState = 2;			// logic unit state
											// op done
					nextState = 0;			// ready state
			end
			6:begin							// logic op xor
				if (currentState == 0)		// ready state
					out = OutXor;
					accumulator = OutXor;
					nextState = 2;			// logic unit state
											// op done
					nextState = 0;			// ready state
			end
			7:begin 						// logic op not
				if (currentState == 0)		// ready state
					out = OutNot;
					accumulator = OutNot;
					nextState = 2;			// logic unit state
											// op done
					nextState = 0;			// ready state
			end
		endcase
	end
endmodule