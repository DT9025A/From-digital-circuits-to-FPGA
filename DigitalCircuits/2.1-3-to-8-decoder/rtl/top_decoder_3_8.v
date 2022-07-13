module top_decoder_3_8(
	input [2:0] addr,
	output [7:0] out
);

//case_decoder_3_8 u_decoder_3_8 (
logic_decoder_3_8 u_decoder_3_8 (
	.addr(addr),
	.out(out)
);

endmodule
