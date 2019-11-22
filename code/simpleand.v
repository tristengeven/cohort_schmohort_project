// logic op AND for 1 bit inputs
module SIMPLE_AND(input A,B, output reg out);
	always @(*) begin
		out <= A & B;
	end
endmodule