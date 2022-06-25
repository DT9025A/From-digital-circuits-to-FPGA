module case_decoder_3_8 (
	input [2:0] addr,
	output reg [7:0] out
);

// 通过case表达式来控制输出，由于存在赋值操作，此处输出为reg类型（variable data type）
always @(*) begin
	case(addr)
		3'b000: out = 8'b1111_1110;
		3'b001: out = 8'b1111_1101;
		3'b010: out = 8'b1111_1011;
		3'b011: out = 8'b1111_0111;
		3'b100: out = 8'b1110_1111;
		3'b101: out = 8'b1101_1111;
		3'b110: out = 8'b1011_1111;
		3'b111: out = 8'b0111_1111;
		default: out = 8'b1111_1111;
	endcase
end
 
endmodule
