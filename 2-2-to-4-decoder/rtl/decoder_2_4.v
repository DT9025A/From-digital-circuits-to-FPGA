module decoder (
	input a,
	input b,
	
	output reg [3:0] decode
);

always @(*) begin
	case({a,b})
		2'b00: decode = 4'b0001;
		2'b01: decode = 4'b0010;
		2'b10: decode = 4'b0100;
		2'b11: decode = 4'b1000;
	endcase
end

endmodule
