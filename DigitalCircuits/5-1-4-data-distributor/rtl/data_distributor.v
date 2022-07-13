module data_distributor (
	input dat,
	input [1:0] addr,
	
	output [3:0] out
);

// 数据分配器的输出逻辑式
assign out[0] = dat & (!addr[1]) & (!addr[0]);
assign out[1] = dat & (!addr[1]) & (addr[0]);
assign out[2] = dat & (addr[1]) & (!addr[0]);
assign out[3] = dat & (addr[1]) & (addr[0]);

endmodule
