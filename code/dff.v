/*
	1 Bit DFF
		- Sets Q equal to D on the positive edge of clk
*/
module DFF_1(input clk, D, output reg Q);
	always @(posedge clk)
		Q <= D;
endmodule

/*
	16 Bit DFF
		- Sets Q equal to D on the positive edge of clk
*/
module DFF_16(input clk, input [15:0] D, output reg [15:0] Q);
	always @(posedge clk)
		Q <= D;
endmodule