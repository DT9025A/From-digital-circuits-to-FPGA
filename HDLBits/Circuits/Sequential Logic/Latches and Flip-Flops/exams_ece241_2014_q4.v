module top_module (
    input clk,
    input x,
    output z
);

	wire q1, q2, q3;
	assign z = !(q1 | q2 | q3);
	
	mydff u_mydff_1(q1 ^ x, clk, q1);
	mydff u_mydff_2(!q2 & x, clk, q2);
	mydff u_mydff_3(!q3 | x, clk, q3);

endmodule

module mydff (
	input d, clk,
	output reg q
);

	always @(posedge clk) begin
		q <= d;
	end

endmodule
