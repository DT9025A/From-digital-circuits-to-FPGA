module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    reg [255:0] sreg;
    assign q = sreg;
    
    integer i, sum;

    always @(posedge clk) begin
        if (load)
            sreg <= data;
        else begin
            for (i = 0; i < 256; i++) begin
                if (i == 0)
                    sum = sreg[1] + sreg[16] + sreg[17] + sreg[240] + sreg[241] + sreg[15] + sreg[31] + sreg[255];
                else if(i == 15)
                    sum = sreg[14] + sreg[16] + sreg[0] + sreg[240] + sreg[254] + sreg[30] + sreg[31] + sreg[255];
                else if(i == 240)
                    sum = sreg[0] + sreg[15] + sreg[239] + sreg[241] + sreg[1] + sreg[224] + sreg[225] + sreg[255];
                else if(i == 255)
                    sum = sreg[0] + sreg[15] + sreg[14] + sreg[224] + sreg[238] + sreg[240] + sreg[239] + sreg[254];
                else if(0 < i & i < 15)
                    sum = sreg[i - 1] + sreg[i + 1] + sreg[i + 15] + sreg[i + 16] + sreg[i + 17] + sreg[i + 239] + sreg[i + 240] + sreg[i + 241];
                else if(i % 16 == 0)
                    sum = sreg[i - 1] + sreg[i + 1] + sreg[i + 15] + sreg[i + 16] + sreg[i + 17] + sreg[i - 16] + sreg[i - 15] + sreg[i + 31];
                else if(i % 16 == 15)
                    sum = sreg[i - 1] + sreg[i + 1] + sreg[i + 15] + sreg[i + 16] + sreg[i - 17] + sreg[i - 16] + sreg[i - 15] + sreg[i - 31];
                else if(240 < i & i < 255)
                    sum = sreg[i - 1] + sreg[i + 1] + sreg[i - 17] + sreg[i - 16] + sreg[i - 15] + sreg[i - 239] + sreg[i - 240] + sreg[i - 241];
                else
                    sum = sreg[i - 1] + sreg[i + 1] + sreg[i - 17] + sreg[i - 16] + sreg[i - 15] + sreg[i + 15] + sreg[i + 16] + sreg[i + 17];

                case (sum)
                    2: sreg[i] <= sreg[i];
                    3: sreg[i] <= 1'b1;
                    default: sreg[i] <= 1'b0;
                endcase
            end
        end
    end

endmodule
