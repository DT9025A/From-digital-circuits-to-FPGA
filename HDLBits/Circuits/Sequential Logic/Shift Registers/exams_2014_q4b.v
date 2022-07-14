module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    wire mux[7:0];
    
    mymux u_mymux_11 (LEDR[3], KEY[3], KEY[1], mux[0]);
    mymux u_mymux_12 (mux[0], SW[3], KEY[2], mux[1]);
    mydff u_mydff_1 (mux[1], KEY[0], LEDR[3]);
    
    mymux u_mymux_21 (LEDR[2], LEDR[3], KEY[1], mux[2]);
    mymux u_mymux_22 (mux[2], SW[2], KEY[2], mux[3]);
    mydff u_mydff_2 (mux[3], KEY[0], LEDR[2]);
    
    mymux u_mymux_31 (LEDR[1], LEDR[2], KEY[1], mux[4]);
    mymux u_mymux_32 (mux[4], SW[1], KEY[2], mux[5]);
    mydff u_mydff_3 (mux[5], KEY[0], LEDR[1]);
    
    mymux u_mymux_41 (LEDR[0], LEDR[1], KEY[1], mux[6]);
    mymux u_mymux_42 (mux[6], SW[0], KEY[2], mux[7]);
    mydff u_mydff_4 (mux[7], KEY[0], LEDR[0]);

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
