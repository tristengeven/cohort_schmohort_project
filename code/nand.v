// logic op nand
module NAND(A, B, Out);
	input [7:0] A;
	input [7:0] B;
	
	output [7:0] Out;
	reg Out;
	
	always @(*) begin
		Out = ~(A & B); // nand
	end
endmodule