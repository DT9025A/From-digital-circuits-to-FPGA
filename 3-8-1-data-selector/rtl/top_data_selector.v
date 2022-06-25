module top_data_selector (
	input [7:0] dat,
	input [2:0] addr,
	
	output out
);


case_data_selector u_data_selector (
	.dat(dat),
	.addr(addr),
	
	.out(out)
);

endmodule
