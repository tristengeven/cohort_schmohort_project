// arithmetic op subtraction
module SUB(A, B, Out, Check);
	input [7:0] A;
	input [7:0] B;
	
	output [7:0] Out;
	output Check;
	
	reg Out;
	reg Check;
	
	always @(*) begin
		Out = A - B; // subtract
		Check = A - B < 0; // check sign
	end
endmodule