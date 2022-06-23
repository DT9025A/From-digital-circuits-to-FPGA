/**
 * K0&K1: 异或门->LED0
**/

module xor_gate (
	input k0,
	input k1,
	output l0
);

assign l0 = ((!k0) ^ (!k1));

endmodule
