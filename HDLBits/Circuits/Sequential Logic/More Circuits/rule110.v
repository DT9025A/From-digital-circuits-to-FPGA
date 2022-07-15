module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    
    reg [511:0] sreg;
    assign q = sreg;
    
    wire [511:0] A, C;
    assign A = {1'b0, sreg[511:1]};
    assign C = {sreg[510:0], 1'b0};

    always @(posedge clk) begin
        if (load)
            sreg <= data;
        else begin
            // use Karnaugh map to simplify it
            // assume A=left, B=center, C=right
            // we have Q = B!C + !AC + !BC
            // then we can construct A, B, C to do logic operation
            sreg <= (sreg & ~C) | (~A & C) | (~sreg & C);
        end
    end

endmodule
