/**
 * You may connect signals to the module by port name or port position. For extra practice, try both methods.
 */

module top_module ( input a, input b, output out );

    // method 1:
    mod_a u_mod_a(a, b, out);
    
    // method 2:
    mod_a u_mod_a(
        .in2(b),
        .in1(a),
        .out(out)
    );
    
endmodule
