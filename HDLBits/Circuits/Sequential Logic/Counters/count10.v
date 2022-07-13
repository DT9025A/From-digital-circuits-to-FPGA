module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    reg [3:0] acc;
    initial acc = 0;
    assign q = acc;
    
    always @(posedge clk) begin
        if (reset)
            acc = 4'd0;
        else begin
            if (acc == 4'd9)
                acc = 4'd0;
            else
        		acc += 1'd1;
        end
    end
    
endmodule
