/*
	Mux (2:1)
		- Outputs the selected input based on the selector bit
*/
module Mux2(input [15:0] in0, in1, input s, output reg [15:0] out);
	always@(*) begin
		if (s == 1'b0)
			out <= in0;
		else
			out <= in1;
		//$display("%d", out);
	end
endmodule

/*
	10 to 1 Mux
		- Outputs the selected input based on the selector bits
*/
module Mux10(input [15:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, input [9:0] s, output reg [15:0] out);
	parameter n = 10;
	always @(*) begin
		out <= (s[0] ? in1:
			   (s[1] ? in2: 
			   (s[2] ? in3:
			   (s[3] ? in4:
			   (s[4] ? in5: 
               (s[5] ? in6:
               (s[6] ? in7:
               (s[7] ? in8: 
			   (s[8] ? in0:
               (s[9] ? in9: 
					   16'b0000000000000000)))))))))); //default 0
	end
endmodule