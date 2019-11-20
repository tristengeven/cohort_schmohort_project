// arithmetic op bitwise shift left
module SHIFTL(A, B, Out, Carry);
	input [7:0] A;
	input [7:0] B;
	
	output [7:0] Out;
	output Carry;
	
	reg Out;
	reg Carry;
	
	always @(*) begin
		Out = A * (2**B); // shift left
		Carry = A / (2**(8-B)) > 0; // carry bit
	end
endmodule
