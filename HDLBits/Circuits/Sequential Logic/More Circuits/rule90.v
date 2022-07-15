module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    
    reg [511:0] sreg;
    assign q = sreg;

    always @(posedge clk) begin
        if (load)
            sreg <= data;
        else begin
            // q[-1] and q[512] both 0, q[511] = 0 ^ q[510] = q[510], q[0] = 0 ^ q[1] = q[1]
            // q[510] = q[511] ^ q[511-2=509]
            // q[1] = q[2] ^ q[2-2=0]
            sreg <= {sreg[510], sreg[511:2] ^ sreg[509:0], sreg[1]};
        end
    end

endmodule
