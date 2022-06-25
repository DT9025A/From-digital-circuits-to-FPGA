 module full_adder (
	input a, b, ci,
	output so, co
 );
 
 // 由真值表化简列逻辑表达式
 assign so = a ^ b ^ ci;
 assign co = (a & b) | ((a ^ b) & ci);
 
 endmodule
 