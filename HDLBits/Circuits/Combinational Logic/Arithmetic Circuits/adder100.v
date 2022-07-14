module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    
    // method 1
    reg [100:0] result;
    assign result = a[99:0] + b[99:0] + cin;
    assign sum = result[99:0];
    assign cout = result[100];
    
    // method 2
    wire [98:0] carry;
    
    full_adder u_full_adder_0(a[0], b[0], cin, carry[0], sum[0]);
    full_adder u_full_adder_99(a[99], b[99], carry[98], cout, sum[99]);
    
    generate
        genvar i;
        for(i = 1; i < 99; i++) begin : add_100
            full_adder u_full_adder(a[i], b[i], carry[i - 1], carry[i], sum[i]);
        end
    endgenerate

endmodule

module full_adder( 
    input a, b, cin,
    output cout, sum );

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | ((a ^ b) & cin);
    
endmodule
