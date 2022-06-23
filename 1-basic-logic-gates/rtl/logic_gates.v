module logic_gates (
	input k0,
	input k1,
	input k2,
	input k3,
	
	output l0,
	output l1,
	output l2,
	output l3
);


/**
 * K0: 非门 -> LED0
 * K1&K2: 与门 -> LED1
 * K2&K3: 或门 -> LED2
**/
not_and_or_gate u_not_and_or_gate (
	.k0(k0),
	.k1(k1),
	.k2(k2),
	.k3(k3),
	.l0(l0),
	.l1(l1),
	.l2(l2)
);

/**
 * K0&K1: 异或门->LED0
**/
//xor_gate u_xor_gate (
//	.k0(k0),
//	.k1(k1),
//	.l0(l0)
//);

endmodule
