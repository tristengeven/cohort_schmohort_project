// arithmetic op multiply
module MULT(A, B, Out, Overflow);
	input [15:0] A;
	input [15:0] B;
	
	output [15:0] Out;
	output Overflow;
	
	reg Out;
	reg Overflow;
	
	always @(*) begin
		if (A * B > 57344) // check for overflow
			begin
				Out = 0;
				Overflow = 1;
			end
		else
			begin	
				Out = A * B; // add
				Overflow = 0;
			end
	end
endmodule