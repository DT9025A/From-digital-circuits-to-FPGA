module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

    reg [3:0] l, m, h;
    initial l = 4'b0;
    initial m = 4'b0;
    initial h = 4'b0;
    
    assign OneHertz = (h == 4'd9 && m == 4'd9 && l == 4'd9);
    assign c_enable = {m == 4'd9 && l == 4'd9, l == 4'd9, 1'b1};
    
    bcdcount counter0 (clk, reset, c_enable[0], l);
    bcdcount counter1 (clk, reset, c_enable[1], m);
    bcdcount counter2 (clk, reset, c_enable[2], h);

endmodule
