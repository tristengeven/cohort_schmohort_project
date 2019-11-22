// logic op AND for 1 bit inputs
module SIMPLE_AND(input x,y, output reg xANDy);
	always @(*) begin
		xANDy <= x & y;
	end
endmodule