`define notImpl(i) not(inA[i], out[i])

module NOT(input[7:0] inA, output[7:0] out);
    assign out = ~inA;
endmodule

module XOR(input[7:0] inA, inB, output[7:0] out);
    assign out = inA ^ inB;
endmodule

module NAND(input[0:7] inA, inB, output[0:7] out);
    assign out = ~(inA | inB);
endmodule

module testbench;
    reg[7:0] inA, inB;
    wire[7:0] out;
    
    // NOT n(inA, out);
    // XOR x(inA, inB, out);
    NAND n(inA, inB, out);

    initial begin
        $monitor("A: %8d, B: %8d, Out: %8d", inA, inB, out);
        inA = 0;
        inB = 0;
        #1 inA = 5; inB = 5;
        #1 inA = 50; inB = 50;
        #1 inA = 51; inB = 1;
        #1 inA = 85; inB = 84;
        #1 inA = 255; inB = 0;
        #1 inA = 0; inB = 255;
        #1 inA = 255; inB = 255;
    end



endmodule