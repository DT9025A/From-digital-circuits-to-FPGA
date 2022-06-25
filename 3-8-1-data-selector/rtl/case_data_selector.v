module case_data_selector (
	input [7:0] dat,
	input [2:0] addr,
	
	output reg out
);

// 根据case表达式分配输出
always @(*) begin
	case(addr)
		3'd0: out = dat[0];
		3'd1: out = dat[1];
		3'd2: out = dat[2];
		3'd3: out = dat[3];
		3'd4: out = dat[4];
		3'd5: out = dat[5];
		3'd6: out = dat[6];
		3'd7: out = dat[7];
		default: out = dat[0];
	endcase
end

endmodule
