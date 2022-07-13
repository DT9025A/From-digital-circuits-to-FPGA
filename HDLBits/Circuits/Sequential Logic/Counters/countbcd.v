module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = (ena[1] && q[7:4] == 4'd9);
    assign ena[3] = (ena[2] && q[11:8] == 4'd9);

    bcd_cnt u_bcd_cnt_1 (clk, reset, 1'b1, q[3:0]);
    bcd_cnt u_bcd_cnt_2 (clk, reset, ena[1], q[7:4]);
    bcd_cnt u_bcd_cnt_3 (clk, reset, ena[2], q[11:8]);
    bcd_cnt u_bcd_cnt_4 (clk, reset, ena[3], q[15:12]);

endmodule

module bcd_cnt (
    input clk,
    input reset,        // Synchronous active-high reset
	input ena,
    output [3:0] q);

    reg [3:0] acc;
    initial acc = 0;
    assign q = acc;
    
    always @(posedge clk) begin
        if(reset)
            acc <= 4'd0;
        else begin
            if(ena)
                if (acc == 4'd9)
                    acc <= 4'd0;
                else
                    acc <= acc + 1'd1;
        end
    end
    
endmodule
