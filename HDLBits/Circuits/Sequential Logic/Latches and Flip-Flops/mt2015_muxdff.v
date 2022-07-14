module top_module (
    input clk,
    input L,
    input r_in,
    input q_in,
    output reg Q);
    
    wire d;
    
    mymux u_mymux_0(q_in, r_in, L, d);
    mydff u_mydff_0(d, clk, Q);

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
