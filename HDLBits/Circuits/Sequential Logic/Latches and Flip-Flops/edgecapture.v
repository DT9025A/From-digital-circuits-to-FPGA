module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    // 通过outval将输出进行锁存
    reg [31:0] last, outval;

    always @(posedge clk) begin
        if (reset) begin
            // 同步reset，可以用非阻塞赋值
            last <= in;
            outval <= 32'd0;
            out <= 0;
        end
        else begin
            // 这里需要用阻塞赋值，否则输出会有一个clock的延迟
            // 提取1变0的位
            outval |= ~in & last;
            // 更新输出，状态通过outval锁存
            out = outval;
            // 更新记录
            last = in;
        end
    end

endmodule
