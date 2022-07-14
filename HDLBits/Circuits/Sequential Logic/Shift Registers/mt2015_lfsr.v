module top_module (
    input [2:0] SW,      // R
    input [1:0] KEY,     // L and clk
    output [2:0] LEDR);  // Q
    
    wire MUX0, MUX1, MUX2;

    mymux u_mymux_0(LEDR[2], SW[0], KEY[1], MUX0);
    mydff u_mydff_0(MUX0, KEY[0], LEDR[0]);
    
    mymux u_mymux_1(LEDR[0], SW[1], KEY[1], MUX1);
    mydff u_mydff_1(MUX1, KEY[0], LEDR[1]);
    
    mymux u_mymux_2(LEDR[1] ^ LEDR[2], SW[2], KEY[1], MUX2);
    mydff u_mydff_2(MUX2, KEY[0], LEDR[2]);

endmodule

module mydff (
    input d, clk,
    output reg q
);

    always @(posedge clk) begin
        q <= d;
    end

endmodule

module mymux (
    input in0, in1, sel,
    output out
);

    assign out = sel ? in1 : in0;

endmodule
