/**
 * Given a 100-bit input vector [99:0], reverse its bit ordering.
 */

module top_module( 
    input [99:0] in,
    output [99:0] out
);

    integer i;
    
    always @(*) begin
        for(i = 0; i < 100; i++)
            out[i] = in[99 - i];
    end

endmodule
