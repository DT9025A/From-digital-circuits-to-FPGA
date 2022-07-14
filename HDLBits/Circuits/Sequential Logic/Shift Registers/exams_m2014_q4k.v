module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [3:0] shiftreg;
    assign out = shiftreg[0];
    
    always @(posedge clk) begin
        if (!resetn) begin
            shiftreg <= 4'd0;
        end
        else begin
            shiftreg <= {in, shiftreg[3:1]};
        end
    end
    
endmodule
