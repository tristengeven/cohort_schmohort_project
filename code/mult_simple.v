module Tristate(in, oe, out);
    input in, oe;
    output out;
    tri out;
    
    bufif1 b1(out, in, oe);
endmodule

module MULTIPLY;
  // two 16-bits input
  reg [15:0] a = 10; // example for test
  reg [15:0] b = 10;
  // output
  output [31:0] c;
  reg c;
  
  always @(*) begin
    c = a*b;
    #1 $display("c= %d", c);
  end
endmodule
