/**
 * Create a 100-bit binary ripple-carry adder by instantiating 100 full adders. The adder adds two 100-bit numbers and a carry-in to produce a 100-bit sum and carry out. To encourage you to actually instantiate full adders, also output the carry-out from each full adder in the ripple-carry adder. cout[99] is the final carry-out from the last full adder, and is the carry-out you usually see.
 */

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    always @(*) begin
        sum[0] = a[0] ^ b[0] ^ cin;
        cout[0] = (a[0] & b[0]) | ((a[0] ^ b[0]) & cin);
        for (integer i = 1; i < 100; i++) begin
            sum[i] = a[i] ^ b[i] ^ cout[i - 1];
            cout[i] = (a[i] & b[i]) | ((a[i] ^ b[i]) & cout[i - 1]);
        end
    end
    
endmodule
