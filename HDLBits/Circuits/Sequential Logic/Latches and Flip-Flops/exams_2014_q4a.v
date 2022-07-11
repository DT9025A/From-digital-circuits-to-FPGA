module top_module (
    input clk,
    input w, R, E, L,
    output Q
);

	wire m1, m2;
	
	mymux u_mymux_1(Q, w, E, m1);
	mymux u_mymux_2(m1, R, L, m2);
	mydff u_mydff_1(m2, clk, Q);

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
 