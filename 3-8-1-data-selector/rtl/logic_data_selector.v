module logic_data_selector (
	input [7:0] dat,
	input [2:0] addr,
	
	output out
);

// 根据逻辑式分配输出
assign out = (
	(!addr[2] & !addr[1] & !addr[0] & dat[0]) |
	(!addr[2] & !addr[1] & addr[0] & dat[1]) |
	(!addr[2] & addr[1] & !addr[0] & dat[2]) |
	(!addr[2] & addr[1] & addr[0] & dat[3]) |
	(addr[2] & !addr[1] & !addr[0] & dat[4]) |
	(addr[2] & !addr[1] & addr[0] & dat[5]) |
	(addr[2] & addr[1] & !addr[0] & dat[6]) |
	(addr[2] & addr[1] & addr[0] & dat[7])
);

endmodule
