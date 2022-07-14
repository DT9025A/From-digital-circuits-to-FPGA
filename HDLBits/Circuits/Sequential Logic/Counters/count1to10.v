module top_module (
    input clk,
    input reset,
    output [3:0] q);
    
    reg [3:0] acc;
    initial acc = 0;
    assign q = acc;
    
    always @(posedge clk) begin
        if(reset)
            acc = 4'd1;
        else begin
            if (acc == 4'd10)
                acc = 4'd1;
            else
                acc += 1'd1;
        end
    end
    
endmodule
