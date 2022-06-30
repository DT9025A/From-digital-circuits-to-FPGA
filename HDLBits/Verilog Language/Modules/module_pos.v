/**
 * You must connect the 6 ports by **position** to your top-level module's ports out1, out2, a, b, c, and d, in that order.
 * 
 * You are given the following module:
 * 
 * module mod_a ( output, output, input, input, input, input );
 */
 
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

	mod_a u_mod_a(out1, out2, a, b, c, d);

endmodule
