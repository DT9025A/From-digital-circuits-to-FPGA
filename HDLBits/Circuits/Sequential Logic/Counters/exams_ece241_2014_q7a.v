module top_module (
    input clk, // posedge
    input reset, // sync rst
    input enable, // hi-enable
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

    assign c_enable = enable;
    // c_load决定什么时候从d锁存数据至q，两个情况：复位或计数到达最大
    assign c_load = reset | (Q == 4'd12 && enable);
    // 计数起始值为1
    assign c_d = 4'd1;
    
    count4 the_counter (clk, c_enable, c_load, c_d, Q);

endmodule
