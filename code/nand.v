module NAND(input[0:7] inA, inB, output[0:7] out);
    assign out = ~(inA | inB);
endmodule