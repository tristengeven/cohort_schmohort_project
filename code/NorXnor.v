module NOR(output z,input x,y);
nor (z,x,y);
//assign c=~(a|b);
endmodule

module XNOR(output z, input x,y);
xnor (z,x,y);
//assign c=~(a^b);
endmodule

//test bench

module NORtest;
reg a,b;
wire c;
NOR NORtest(c,a,b);
initial
begin
#000 a=0;b=0;
#100 a=0;b=1;
#100 a=1;b=0;
#100 a=1;b=1;
end
initial
begin
$monitor($time,"a=%b,b=%b,c=%b",a,b,c);
end
endmodule

module XNORTest;
reg a,b;
wire c;
XNOR  XNORTest(c,a,b);
initial
begin
#000 a=0;b=0; // a = f, b = f, 
#100 a=0;b=1;
#100 a=1;b=0;
#100 a=1;b=1;
end
initial
begin
$monitor($time,"a=%b,b=%b,c=%b",a,b,c);
end
endmodule