module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A = 1'b0, B = 1'b1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        // 在组合逻辑块内做下一状态转换
        case (state)
            A: next_state <= in ? A : B;
            B: next_state <= in ? B : A;
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        // 在时序逻辑块内做输出状态转换
        if(areset)
        	state <= B;
        else
            state <= next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == A ? 1'b0 : 1'b1);

endmodule
