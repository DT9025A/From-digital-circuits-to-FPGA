/**
 * Build a 4-bit priority encoder. For this problem, if none of the input bits are high (i.e., input is zero), output zero. Note that a 4-bit number has 16 possible combinations.
 */

// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos);

    always @(*) begin
        if (in[0])
            pos = 2'd0;
        else if (in[1])
            pos = 2'd1;
        else if (in[2])
            pos = 2'd2;
        else if (in[3])
            pos = 2'd3;
        else
            pos = 2'd0;
    end
    
endmodule
