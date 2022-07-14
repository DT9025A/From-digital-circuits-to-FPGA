module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 

    always @(posedge clk) begin
        if (load) begin
            q <= data;
        end
        else if (ena) begin
            case (amount)
                2'b00: q <= {q[62:0], 1'b0};
                2'b01: q <= {q[53:0], 8'b0};
                2'b10: q <= {q[63], q[63:1]}; //右移补符号位，shifts in the sign bit of the number in the shift register (q[63] in this case)
                2'b11: q <= {{8{q[63]}}, q[63:8]};
                default: q <= q;
            endcase
        end
        else
            q <= q;
    end
    
endmodule
