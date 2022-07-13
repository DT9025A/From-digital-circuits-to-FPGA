/**
 * K0: 非门 -> LED0
 * K1&K2: 与门 -> LED1
 * K2&K3: 或门 -> LED2
**/

module not_and_or_gate (
	input k0,
	input k1,
	input k2,
	input k3,
	
	output l0,
	output l1,
	output l2
);

// 由于按键是上拉的，对按键取值取个反
// 组合逻辑电路不需要时序，且组合较为简单，不需要产生寄存器，故用assign就行，不需要always @(*)
assign l0 = !(!k0); // 两次取反，相当于直通
assign l1 = ((!k1) && (!k2));
assign l2 = ((!k2) || (!k3));

endmodule
