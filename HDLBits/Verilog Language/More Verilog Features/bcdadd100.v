/**
 * You are provided with a BCD one-digit adder named bcd_fadd that adds two BCD digits and carry-in, and produces a sum and carry-out.
 * module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
 * Instantiate 100 copies of bcd_fadd to create a 100-digit BCD ripple-carry adder. Your adder should add two 100-digit BCD numbers (packed into 400-bit vectors) and a carry-in to produce a 100-digit sum and carry out.
 */

module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

	// to save carry from provious instance
	wire [98:0] carry;
	
	// first and last instance, indicates cin and cout
	bcd_fadd u_bcd_fadd_0(a[3:0], b[3:0], cin, carry[0], sum[3:0]);
	bcd_fadd u_bcd_fadd_99(a[399:396], b[399:396], carry[98], cout, sum[399:396]);
	
	// use "generate" to generate instances
	generate
		genvar i;
		
		for (i = 1; i < 99; i++) begin: bcdadd100
			bcd_fadd u_bcd_fadd(a[i * 4 + 3: i * 4], b[i * 4 + 3: i * 4], carry[i - 1], carry[i], sum[i * 4 + 3: i * 4])
		end
	endgenerate
	
endmodule
