/*
	Half-Adder
	a XOR b => sum
	a AND b => c_out
*/
module Half_Adder (input a, b, output c_out, sum);
   xor G1(sum, a, b);
   and G2(c_out, a, b);
endmodule

/*
	Full-Adder
	Implements Half-Adders
*/
module Full_Adder (input a, b, c_in, output c_out, sum);
   wire w1, w2, w3;				// w1 = c_out, w2 = sum
   Half_Adder M1 (a, b, w1, w2);
   Half_Adder M0 (w2, c_in, w3, sum);
   or G1(c_out, w1, w3);
endmodule

/*
	4 Bit Adder
	Implements Full-Adders
*/
module Adder_4bit (input [3:0] a, b, input c_in, output c_out, output [3:0] sum);
   wire c_in1, c_in2, c_in3; // carries
   
   Full_Adder M0 (a[0], b[0], c_in,  c_in1, sum[0]); 
   Full_Adder M1 (a[1], b[1], c_in1, c_in2, sum[1]);
   Full_Adder M2 (a[2], b[2], c_in2, c_in3, sum[2]);
   Full_Adder M3 (a[3], b[3], c_in3, c_out, sum[3]);
endmodule

/*
	8 Bit Adder
   Implements 4 Bit Adders
*/
module Adder_8bit (input [7:0] a, b, input c_in, output wire c_out, output wire [7:0] sum);
	wire c_in4;
	wire unsigned [7:0] b2 = b;

   Adder_4bit M0(a[3:0], b2[3:0], c_in, c_in4, sum[3:0]);
   Adder_4bit M1(a[7:4], b2[7:4], c_in4, c_out, sum[7:4]);
endmodule

module Adder_16bit (input [15:0] a, b, input c_in, output wire c_out, output wire [15:0] sum);
	wire c_in4;
	wire unsigned [15:0] b2 = c_in == 1'b1 ? ~b: b; // negate b if c_in = 1

   Adder_8bit M0(a[7:0], b2[7:0], c_in, c_in4, sum[7:0]);
   Adder_8bit M1(a[15:8], b2[15:8], c_in4, c_out, sum[15:8]);
endmodule