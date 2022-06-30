/**
 * Create a module with the same functionality as the 7458 chip. It has 10 inputs and 2 outputs. You may choose to use an assign statement to drive each of the output wires, or you may choose to declare (four) wires for use as intermediate signals, where each internal wire is driven by the output of one of the AND gates. For extra practice, try it both ways.
 */

module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

	// wire declares
	wire int_p1abc, int_p1def;
	wire int_p2ab, int_p2cd;
	
	// internal logic assigns
	assign int_p1abc = p1a & p1b & p1c;
	assign int_p1def = p1d & p1e & p1f;
	assign int_p2ab = p2a & p2b;
	assign int_p2cd = p2c & p2d;
	
	// output logic assign
	assign p1y = int_p1abc | int_p1def;
	assign p2y = int_p2ab | int_p2cd;

endmodule
