/**
 * Build a priority encoder for 8-bit inputs. Given an 8-bit vector, the output should report the first bit in the vector that is 1. Report zero if the input vector has no bits that are high. For example, the input 8'b10010000 should output 3'd4, because bit[4] is first bit that is high.
 */

// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos  );
	
	always @(*) begin
		casez(in)
			8'bzzzz_zzz1: pos = 3'd0;
			8'bzzzz_zz10: pos = 3'd1;
			8'bzzzz_z100: pos = 3'd2;
			8'bzzzz_1000: pos = 3'd3;
			8'bzzz1_0000: pos = 3'd4;
			8'bzz10_0000: pos = 3'd5;
			8'bz100_0000: pos = 3'd6;
			8'b1000_0000: pos = 3'd7;
			default: pos = 3'd0;
		endcase
	end
	
endmodule
