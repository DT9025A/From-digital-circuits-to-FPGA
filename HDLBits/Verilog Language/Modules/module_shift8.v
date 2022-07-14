/**
 * You are given a module my_dff8 with two inputs and one output (that implements a set of 8 D flip-flops). Instantiate three of them, then chain them together to make a 8-bit wide shift register of length 3. In addition, create a 4-to-1 multiplexer (not provided) that chooses what to output depending on sel[1:0]: The value at the input d, after the first, after the second, or after the third D flip-flop. (Essentially, sel selects how many cycles to delay the input, from zero to three clock cycles.)
 * 
 * The module provided to you is: module my_dff8 ( input clk, input [7:0] d, output [7:0] q );
 */

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    // internal wire
    wire [7:0] q1, q2, q3;
    
    // dff instances
    my_dff8 u_my_dff8_1(clk, d, q1);
    my_dff8 u_my_dff8_2(clk, q1, q2);
    my_dff8 u_my_dff8_3(clk, q2, q3);
    
    // mux select logic
    always @(*) begin
        case(sel)
            2'd0: q = d;
            2'd1: q = q1;
            2'd2: q = q2;
            2'd3: q = q3;
            default: q = d;
        endcase
    end

endmodule
