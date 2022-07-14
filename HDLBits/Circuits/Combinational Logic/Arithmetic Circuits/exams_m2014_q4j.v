 module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    wire [2:0] carry;
    
    full_adder u_full_adder_1(x[0], y[0], 0, carry[0], sum[0]);
    full_adder u_full_adder_2(x[1], y[1], carry[0], carry[1], sum[1]);
    full_adder u_full_adder_3(x[2], y[2], carry[1], carry[2], sum[2]);
    full_adder u_full_adder_4(x[3], y[3], carry[2], sum[4], sum[3]);
    
endmodule

module full_adder( 
    input a, b, cin,
    output cout, sum );

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | ((a ^ b) & cin);
    
endmodule
