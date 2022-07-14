module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    
    reg [7:0] shiftreg;
    initial shiftreg = 8'd0;
    
    // 我去，还能这样做
    assign Z = shiftreg[{A, B, C}];
    
    always @(posedge clk) begin
        if (enable) begin
            shiftreg <= {shiftreg[6:0], S};
        end
    end

endmodule
