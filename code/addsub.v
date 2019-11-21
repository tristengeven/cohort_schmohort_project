module ADD(C, O, A, B);
   input [3:0] A;
   input [3:0] B;
   output [3:0] O;
   output       C;

   assign {C, O} = A + B;
   // assign C1 = A[0] + B[0];
   // assign C2 = A[0] + B[1];
endmodule

module SUBTRACT(C, O, A, B);
   input [3:0] A;
   input [3:0] B;
   output [3:0] O;
   output       C;

   assign {C, O} = A - B;
   // assign C1 = A[0] - B[0];
   // assign C2 = A[0] - B[1];
endmodule


module ADDTEST

wire Cout;
reg Cin;
wire[1:0] Sum;
reg [1:0] A;
reg [1:0] B;

ADD ADDTEST(Cout, Sum, A, B, Cin);
initial
begin
    A[1:0] = 2'b00;
    B[1:0] = 2'b00;
    Cin = 1'b0;
end

endmodule;

module SUBTEST

wire Cout;
reg Cin;
wire[1:0] Sum;
reg [1:0] A;
reg [1:0] B;

SUBTRACT SUBTEST(Cout, Sum, A, B, Cin);
initial
begin
    A[1:0] = 2'b00;
    B[1:0] = 2'b00;
    Cin = 1'b0;
end

endmodule;

module ADD (input x, y, output z);
  assign c = a + b;
endmodule

module SUBTRACT(input x,y, output z);
  assign c = a - b;
endmodule