module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);

    wire ena_mm, ena_hh;
    
    // 分钟进位：59秒+1
    assign ena_mm = ena & (ss == 8'h59);
    // 小时进位：59分59秒+1
    assign ena_hh = ena_mm & (mm == 8'h59);
    
    cnt60 u_cnt60_ss(clk, reset, ena, ss);
    cnt60 u_cnt60_mm(clk, reset, ena_mm, mm);
    cnt12 u_cnt12_hh(clk, reset, ena_hh, hh, pm);

endmodule

module cnt12
(
    input clk,
    input reset,
    input ena,
    output reg [7:0] counter,
    output reg pm
);
    // 初始为上午12时
    initial pm = 1'b0;
    initial counter = 8'h12;
    
    always @(posedge clk) begin
        if (reset) begin
            counter <= 8'h12;
            pm <= 1'b0;
        end
        else begin
            if (ena) begin
                if (counter == 8'h11) begin
                    // 该PM了
                    pm <= !pm;
                    counter <= counter + 8'h1;
                end
                else if (counter == 8'h12) begin
                    counter <= 8'h1;
                end
                else if (counter == 8'h9) begin
                    counter <= 8'h10;
                end
                else begin
                    counter <= counter + 8'h1;
                end
            end
        end
    end

endmodule


module cnt60
(
    input clk,
    input reset,
    input ena,
    output reg [7:0] counter
);

    always @(posedge clk) begin
        if (reset) begin
            counter <= 8'h0;
        end
        else begin
            if (ena) begin
                if (counter == 8'h59) begin
                    counter <= 8'h0;
                end
                else if (counter[3:0] == 4'd9) begin
                    counter[7:4] <= counter[7:4] + 4'd1;
                    counter[3:0] <= 4'd0;
                end
                else begin
                    counter[3:0] <= counter[3:0] + 4'd1;
                end
            end
        end
    end

endmodule
