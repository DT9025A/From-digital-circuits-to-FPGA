module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = (!b & !c) | (!a & !c & !d) | (a & c & d) | (!a & b & c) | (!a & c & !d);
    
endmodule
