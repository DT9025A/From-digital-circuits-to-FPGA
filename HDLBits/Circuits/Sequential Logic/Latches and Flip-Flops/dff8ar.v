module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);

    always @(posedge clk or posedge areset) begin
        if (areset)
            q[7:0] <= 8'h0;
        else
            q[7:0] <= d[7:0];
    end

endmodule
