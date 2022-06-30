/**
 * Case statements are more convenient than if statements if there are a large number of cases. So, in this exercise, create a 6-to-1 multiplexer. When sel is between 0 and 5, choose the corresponding data input. Otherwise, output 0. The data inputs and outputs are all 4 bits wide.
 * 
 * Be careful of inferring latches (See.always_if2)
 */

// synthesis verilog_input_version verilog_2001
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        case(sel)
			3'd0: out = data0;
			3'd1: out = data1;
			3'd2: out = data2;
			3'd3: out = data3;
			3'd4: out = data4;
			3'd5: out = data5;
			default: out = 4'b0;
		endcase
    end

endmodule
