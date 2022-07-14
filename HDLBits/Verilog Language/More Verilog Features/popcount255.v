/**
 * A "population count" circuit counts the number of '1's in an input vector. Build a population count circuit for a 255-bit input vector.
 */

module top_module( 
    input [254:0] in,
    output [7:0] out );

    integer i;
    reg[7:0] cnt;
    
    assign out = cnt;
    
    always @(*) begin
        cnt = 7'd0;
        for(i = 0; i < 255; i++)
            if (in[i])
                cnt += 1'b1;
    end
    
endmodule
