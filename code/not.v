// logic op not
module NOT(A, Out);
	input [7:0] A;
	
	output [7:0] Out;
	reg Out;
	
	always @(*) begin
		Out = !A; // not
	end
endmodule