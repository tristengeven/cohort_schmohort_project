// arithmetic op shift left
module SHIFTL(A, B, Out);
	input [15:0] A;
	input [15:0] B;
	
	output [15:0] Out;
	reg Out;
	
	always @(*) begin
		Out = A << B; // shift left
	end
endmodule