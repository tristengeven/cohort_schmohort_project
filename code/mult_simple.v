{\rtf1\ansi\ansicpg1252\deff0\nouicompat{\fonttbl{\f0\fnil\fcharset0 Calibri;}}
{\*\generator Riched20 10.0.17763}\viewkind4\uc1 
\pard\sa200\sl276\slmult1\f0\fs22\lang9 module Tristate(in, oe, out);\par
    input in, oe;\par
    output out;\par
    tri out;\par
    \par
    bufif1 b1(out, in, oe);\par
endmodule\par
\par
module MULTIPLY;\par
  // two 16-bits input\par
  reg [15:0] a = 10; // example for test\par
  reg [15:0] b = 10;\par
  // output\par
  output [31:0] c;\par
  reg c;\par
  \par
  always @(*) begin\par
    c = a*b;\par
    #1 $display("c= %d", c);\par
  end\par
endmodule\par
}
 