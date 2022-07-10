module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
    // assign s = ...
    // assign overflow = ...
	assign s = a + b;
	// hint: 两负相加变正、两正相加变负表示溢出
	assign overflow = a[7] & b[7] & ~s[7] | ~a[7] & ~b[7] & s[7];

endmodule
