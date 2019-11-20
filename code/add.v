// arithmetic op addition
module ADD(A, B, Out, Check);
	input [7:0] A;
	input [7:0] B;
	
	output [7:0] Out;
	output Check;
	
	reg Out;
	reg Check;
	
	always @(*) begin
		Out = A + B; // add
		Check = A + B > 127; // check for overflow
	end
endmodule