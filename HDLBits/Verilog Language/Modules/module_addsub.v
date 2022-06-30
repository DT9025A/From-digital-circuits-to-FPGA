/**
 * You are provided with a 16-bit adder module, which you need to instantiate twice:
 * 
 * module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
 * 
 * Use a 32-bit wide XOR gate to invert the b input whenever sub is 1. (This can also be viewed as b[31:0] XORed with sub replicated 32 times. See replication operator.). Also connect the sub input to the carry-in of the adder.
 */

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

	wire [31:0] pb;
	wire [15:0] lo_result, hi_result;
	wire lo_cout;
	
	assign pb = {32{sub}} ^ b;
	assign sum = {hi_result, lo_result};
	
	add16 u_add16_lo(a[15:0], pb[15:0], sub, lo_result, lo_cout);
	add16 u_add16_hi(a[31:16], pb[31:16], lo_cout, hi_result);

endmodule
