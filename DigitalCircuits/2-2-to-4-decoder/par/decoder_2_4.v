module decoder_2_4 (
	input k0,
	input k1,
	
	output reg [3:0] decode
);

// 产生寄存器类型的组合逻辑，RTL会直接简化成译码器
// 编码器可以由译码器反推一下得到，就不写了
always @(*) begin
	case({!k1,!k0})
		2'b00: decode = 4'b0001;
		2'b01: decode = 4'b0010;
		2'b10: decode = 4'b0100;
		2'b11: decode = 4'b1000;
	endcase
end

endmodule
