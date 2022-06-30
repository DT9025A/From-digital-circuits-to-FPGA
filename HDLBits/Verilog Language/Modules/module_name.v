/**
 * You are given a module named mod_a that has 2 outputs and 4 inputs, in some order. You must connect the 6 ports by **name** to your top-level module's ports:
 */

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

	mod_a u_mod_a(
		.out1(out1),
		.out2(out2),
		.in1(a),
		.in2(b),
		.in3(c),
		.in4(d)
	);

endmodule
