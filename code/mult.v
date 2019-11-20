// buffer gate
module Tristate(in, oe, out);
    input in, oe;
    output out;
    tri out;
    
    bufif1 b1(out, in, oe);
endmodule

module multi_8_bit(
	//a : multiplicand
	//b : multiplier
	//p : product
	input [7:0] a,
	input [7:0] b,
	output reg [15:0] p
);
	reg [16:0] tmp_a, tmp_a_2comp, tmp_p;
	reg [7:0] a_2comp;
	integer i;
	
	always @(*) begin
		//Calculating the two's complement of the multiplicand.
		a_2comp = ((~ a) + 1'b1);
		tmp_a = {a, 9'b000000000};
		tmp_a_2comp = {a_2comp, 9'b000000000};
		
		//Temporary product initial value
		tmp_p = {8'b00000000, b, 1'b0};		
		
		for(i=0; i<8; i=i+1) begin
			case(tmp_p[1:0])
				2'b00 : tmp_p = { tmp_p[16], tmp_p[16:1] };
				2'b01 : begin
							tmp_p = tmp_p + tmp_a;
							tmp_p = { tmp_p[16], tmp_p[16:1] };
						  end
				2'b11 : tmp_p = { tmp_p[16], tmp_p[16:1] };
				2'b10 : begin
							tmp_p = tmp_p + tmp_a_2comp;
							tmp_p = { tmp_p[16], tmp_p[16:1] };
						  end
				default : tmp_p = 17'bx;
			endcase	
		end
		
		assign p = tmp_p[16:1];
	end	
endmodule

module multi_8_bit_test;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [15:0] p;

	// Instantiate the Unit Under Test (UUT)
	multi_8_bit uut (
		.a(a), 
		.b(b), 
		.p(p)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
	end
	
	initial
		$monitor( "a(%b) * b(%b) = product(%b)", a, b, p );
	
	always @(a or b) begin
			#100 {a,b} = 278;
			#200 {a,b} = 1802;
	end
      
endmodule