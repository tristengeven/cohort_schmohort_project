//tt
//Creating the three bit codes for AND and OR
//These can be changed by graycode when refactoring.
`define AND 3'b000
`define OR 3'001

module AND(input x,y, output xANDy);
    always@(*) begin
        xANDy <= x & y;
    end
endmodule

module OR(input x,y, output xORy);
    always@(*) begin
        xORy <= x | y;
    end
endmodule
//Parameter of 8, 2:1
module mux2(x,y,s,b);
    parameter k = 8 ;
    input[k-1:0] x,y;
    input[1:0] s;
    output[k-1:0] b;
    assign b = ({k{s[1]}} &x)|
               ({k{s[0]}} &y);
endmodule

module mux4(p0,p1,p2,p3,p4,p5,p6,p7,s,b)
    parameter k = 8;
    input [k-1:0] p0,p1,p2,p3,p4,p5,p6,p7;
    input [k-1:0] s;
    output [k-1:0] b;
    assign b = ({k{s[0]}} &p0)|
               ({k{s[1]}} &p1)|
               ({k{s[2]}} &p2)|
               ({k{s[3]}} &p3)|
               ({k{s[4]}} &p4)|
               ({k{s[5]}} &p5)|
               ({k{s[6]}} &p6)|
               ({k{s[7]}} &p7);
endmodule