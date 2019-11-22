// logic op AND for 1 bit inputs
module SIMPLE_AND(input A,B, output reg aANDb);
	always @(*) begin
		aANDb <= A & B;
	end
endmodule