module top_module (input x, input y, output z);

    wire z1, z2, z3, z4;
    
    assign z = (z1 | z2) ^ (z3 & z4);
    
    A u_A1(x, y, z1);
    B u_B1(x, y, z2);
    A u_A2(x, y, z3);
    B u_B2(x, y, z4);
    
endmodule

module A (input x, input y, output z);
    assign z = (x^y) & x;
endmodule

module B ( input x, input y, output z );
    assign z = (!x & !y) | (x & y);
endmodule
