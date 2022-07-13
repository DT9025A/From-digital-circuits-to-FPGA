'timescale 1ns/1ns

module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);

	wire css, cmm;
	reg r_pm;
	initial r_pm = 1'b0;
	
	cnt u_cnt_ss (
		clk, reset, ena, ss, css
	);
	cnt u_cnt_mm (
		css, reset, ena, mm, cmm
	);
	cnt #(
		.MAXIMUM_CNT(12),
		.RESET_VALUE(12),
		.RELOAD_VALUE(1)
	) u_cnt_hh (
		cmm, reset, ena, hh
	);

endmodule

module cnt #(
	parameter MAXIMUM_CNT = 8'h59,
	parameter RESET_VALUE = 8'h00,
	parameter RELOAD_VALUE = 8'h00
)
(
	input clk,
	input reset,
	input ena,
	output reg [7:0] counter,
	output carry
);
	always @(posedge clk) begin
		if (reset)
			counter <= RESET_VALUE;
		else begin
			if (ena) begin
				if (counter == MAXIMUM_CNT) begin
					carry = 1;
					counter <= 8'd0;
				end
				if (counter[3:0] == 4'd9) begin
					counter[7:4] <= counter[7:4] + 1;
					counter[3:0] <= 4'd0;
					carry = 0;
				end
				else begin
					counter[3:0] <= counter[3:0] + 1;
					carry = 0;
				end
			end
		end
	end

endmodule