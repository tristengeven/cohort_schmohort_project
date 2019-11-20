// arithmetic op multiplication
module MULT(A, B, Out, Check);
	input [7:0] A;
	input [7:0] B;
	
	output [7:0] Out;
	output Check;
	
	reg Out;
	reg Check;
	
	always @(*) begin
		Out = A * B; // multiply
		Check = A * B > 255; // check for overflow
	end
endmodule