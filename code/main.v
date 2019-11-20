/*
	CS 4341.001
	Fall 2019
	Cohort: Cohort Schmohort 
	Icarus Verilog v0.9.7 (source: http://bleyer.org/icarus/)
*/

`include "alu.v"

module Test_Bench;
	// inputs
	reg [3:0] funct;				// selector for op
	reg signed [7:0] A;			// operand A
	reg signed [7:0] B;			// operand B
	reg [1:0] currentState;	 	// current state
	reg [5*8:0] currentString;
	reg	[5*8:0] opString;
	reg [5*8:0] nextString;

	// outputs
	wire [1:0] nextState;
	wire [7:0] accumulator;
	wire signed [7:0] out;
	wire carry;
	wire overflow;
	
	// generate alu
	ALU alu(funct, A, B, currentState, nextState, accumulator, out, carry, overflow);
	
	initial begin
		$display(" Operand A       | Operand B       | Operation    | Current State | Output          | Next State");
		$display("-----------------|-----------------|--------------|---------------|-----------------|------------");
		currentState = 0;	// reset
		funct = 0;
		forever begin
			//Uses random values to display various results
			A = 24;
			B = 6;
			#5
			if(currentState == 0)
				currentString = "READY";
			if(currentState == 1)
				currentString = "ARITH";
			if(currentState == 2)
				currentString = "LOGIC";
			if(currentState == 3)
				nextString = "ERROR";
			if(funct == 0)
				opString = "ADD";
			if(funct == 1)
				opString = "SUB";
			if(funct == 2)
				opString = "SHFTL";
			if(funct == 3)
				opString = "SHFTR";
			if(funct == 4)
				opString = "AND";
			if(funct == 5)
				opString = "OR";
			if(funct == 6)
				opString = "XOR";
			if(funct == 7)
				opString = "NOT";
			if(nextState == 0)
				nextString = "READY";
			if(nextState == 1)
				nextString = "ARITH";
			if(nextState == 2)
				nextString = "LOGIC";
			if(nextState == 3)
				nextString = "ERROR";
			$display(" %8b (%4d) | %8b (%4d) | %-6s (%3b) | %-8s (%2d) | %8b (%4d) | %-5s (%2d)", A, A, B, B, opString, funct, currentString, currentState, out, out, nextString, nextState);
			funct = funct + 1;

		end
	end
	
	initial begin
		#40 $finish;
	end
endmodule