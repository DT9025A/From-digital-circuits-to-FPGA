// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A = 1'b0, B = 1'b1; 
    reg present_state, next_state;

    always @(*) begin
        case (present_state)
            // Fill in state transition logic
            A: next_state <= in ? A : B;
            B: next_state <= in ? B : A;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state = B;
        end else begin
            // State flip-flops
            present_state = next_state;
        end
    end
    
    assign out = (present_state == A ? 1'b0 : 1'b1);

endmodule
