// logic op or
module OR(A, B, Out);
	input [15:0] A;
	input [15:0] B;
	
	output [15:0] Out;
	reg Out;
	
	always @(*) begin
		Out = A | B; // or
	end
endmodule