// arithmetic op bitwise shift right
module SHIFTR(A, B, Out, Carry);
	input [7:0] A;
	input [7:0] B;
	
	output [7:0] Out;
	output Carry;
	
	reg Out;
	reg Carry;
	
	always @(*) begin
		Out = A / (2**B); // shift right
		Carry = A * (2**B) > 0; // carry bit
	end
endmodule