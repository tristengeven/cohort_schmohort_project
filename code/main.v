/*
	CS 4341.001
	Fall 2019
	Cohort: Cohort Schmohort 
	Icarus Verilog v10.1.1 (source: http://bleyer.org/icarus/)
*/

`include "alu.v"

module Test_Bench;
	parameter bits = 16;
	reg clk, rst;
	reg unsigned [bits-1:0] A, B;
	reg [2:0] opcode;
	wire [bits-1:0] out;
	wire status;
	
	// generate ALU
	ALU alu(clk, rst, A, B, opcode, out, status);
	
	initial begin
		$display("          Input A          |         Input B          |   Op Code/Operation   |           Output           | Next State");
		$display("---------------------------|--------------------------|-----------------------|----------------------------|------------");
		rst = 0; clk = 0;
		#5 rst = 1; #5 clk = 1; #5 clk = 0; rst = 0; $display("                                                               (RESET)               %b", out);
		#5 A = 33; B = 45; opcode = `ADD;
		#5 clk = 1; #5; clk = 0; 
		$display("   %b (%d)|  %b (%d)|     %b      (%s)    |%b     (%d)|   %0s", A, A, B, B, opcode, "ADD", status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? "Ready" : "ERROR");
		#5 rst = 1; #5 clk = 1; #5 clk = 0; rst = 0;
		#5 A = 64; B = 30; opcode = `SUB;
		#5 clk = 1; #5; clk = 0; 
		$display("   %b (%d)|  %b (%d)|     %b      (%s)    |%b     (%d)|   %0s", A, A, B, B, opcode, "SUB", out, out, status == 1'b0 ? "Ready" : "Ready");
		#5 rst = 1; #5 clk = 1; #5 clk = 0; rst = 0;
		#5 A = 12; B = 12; opcode = `MULT;
		#5 clk = 1; #5; clk = 0; 
		$display("   %b (%d)|  %b (%d)|     %b      (%s)    |%b     (%d)|   %0s", A, A, B, B, opcode, "MULT", out, out, status == 1'b0 ? "Ready" : "Ready");
		#5; A = 9999; B = 9999; opcode = `MULT;
		#5 clk = 1; #5; clk = 0; 
		$display("   %b (%d)|  %b (%d)|     %b      (%s)   |%b     (%d)|   %0s", A, A, B, B, opcode, "MULT", status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? "Ready" : "ERROR");
		#5 rst = 1; #5 clk = 1; #5 clk = 0; rst = 0; $display("                                                               (RESET)               %b", out);
		#5; A = 10; B = 1; opcode = `SHIFT_LEFT;
		#5 clk = 1; #5; clk = 0; 
		$display("   %b (%d)|  %b (%d)|     %b      (%s)  |%b     (%d)|   %0s", A, A, B, B, opcode, "LSHFT", status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? "Ready" : "ERROR");
		#5 rst = 1; #5 clk = 1; #5 clk = 0; rst = 0;
		#5; A = 3855; B = 13107; opcode = `AND;
		#5 clk = 1; #5; clk = 0; 
		$display("   %b (%d)|  %b (%d)|     %b      (%s)    |%b     (%d)|   %0s", A, A, B, B, opcode, "AND", status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? "Ready" : "ERROR");
		#5 rst = 1; #5 clk = 1; #5 clk = 0; rst = 0;
		#5; A = 3855; B = 13107; opcode = `OR;
		#5 clk = 1; #5; clk = 0; 
		$display("   %b (%d)|  %b (%d)|     %b      (%s)     |%b     (%d)|   %0s", A, A, B, B, opcode, "OR", status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? "Ready" : "ERROR");
		#5 rst = 1; #5 clk = 1; #5 clk = 0; rst = 0;
		#5; A = 3855; B = 13107; opcode = `XOR;
		#5 clk = 1; #5; clk = 0; 
		$display("   %b (%d)|  %b (%d)|     %b      (%s)    |%b     (%d)|   %0s", A, A, B, B, opcode, "XOR", status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? "Ready" : "ERROR");
		#5 rst = 1; #5 clk = 1; #5 clk = 0; rst = 0;
		#5; A = 3855; B = 13107; opcode = `NOT;
		#5 clk = 1; #5; clk = 0; 
		$display("   %b (%d)|  %b (%d)|     %b      (%s)    |%b     (%d)|   %0s", A, A, B, B, opcode, "NOT", status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? out : 16'b0000000000000000, status == 1'b0 ? "Ready" : "ERROR");
		#5 rst = 1; #5 clk = 1; #5 clk = 0; rst = 0; $display("                                                               (RESET)               %b", out);
		$finish;
	end
endmodule