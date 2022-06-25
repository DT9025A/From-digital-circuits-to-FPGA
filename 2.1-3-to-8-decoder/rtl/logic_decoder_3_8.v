module logic_decoder_3_8 (
	input [2:0] addr,
	output [7:0] out
);

// 通过3-8译码器的逻辑式来assign输出
assign out[0] = !(!addr[0] & !addr[1] & !addr[2]);
assign out[1] = !(addr[0] & !addr[1] & !addr[2]);
assign out[2] = !(!addr[0] & addr[1] & !addr[2]);
assign out[3] = !(addr[0] & addr[1] & !addr[2]);
assign out[4] = !(!addr[0] & !addr[1] & addr[2]);
assign out[5] = !(addr[0] & !addr[1] & addr[2]);
assign out[6] = !(!addr[0] & addr[1] & addr[2]);
assign out[7] = !(addr[0] & addr[1] & addr[2]);
 
endmodule
 