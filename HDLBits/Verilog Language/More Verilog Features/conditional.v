/**
 * Given four unsigned numbers, find the minimum. Unsigned numbers can be compared with standard comparison operators (a < b). Use the conditional operator to make two-way min circuits, then compose a few of them to create a 4-way min circuit. You'll probably want some wire vectors for the intermediate results.
 */

module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0] s1, s2;
    
    // assign intermediate_result1 = compare? true: false;
    assign s1 = a < b ? a : b;
    assign s2 = c < d ? c : d;
    assign min = s1 < s2 ? s1 : s2;

endmodule
