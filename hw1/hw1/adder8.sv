module adder8(

  input  [7:0]  a,       //data in a
  input  [7:0]  b,       //data in b
  output [7:0] sum_out,  //sum output
  output c_out           //carry output
  );

wire c0,c1,c2,c3,c4,c5,c6;

fadder bit0(
		.a		(a[0]		),
		.b		(b[0]		),
		.cin		(1'b0		),
		.sum_out	(sum_out[0]	),
		.c_out		(c0		)
);

fadder bit1(
		.a		(a[1]		),
		.b		(b[1]		),
		.cin		(c0		),
		.sum_out	(sum_out[1]	),
		.c_out		(c1		)
);

fadder bit2(
		.a		(a[2]		),
		.b		(b[2]		),
		.cin		(c1		),
		.sum_out	(sum_out[2]	),
		.c_out		(c2		)
);

fadder bit3(
		.a		(a[3]		),
		.b		(b[3]		),
		.cin		(c2		),
		.sum_out	(sum_out[3]	),
		.c_out		(c3		)
);

fadder bit4(
		.a		(a[4]		),
		.b		(b[4]		),
		.cin		(c3		),
		.sum_out	(sum_out[4]	),
		.c_out		(c4		)
);

fadder bit5(
		.a		(a[5]		),
		.b		(b[5]		),
		.cin		(c4		),
		.sum_out	(sum_out[5]	),
		.c_out		(c5		)
);

fadder bit6(
		.a		(a[6]		),
		.b		(b[6]		),
		.cin		(c5		),
		.sum_out	(sum_out[6]	),
		.c_out		(c6		)
);

fadder bit7(
		.a		(a[7]		),
		.b		(b[7]		),
		.cin		(c6		),
		.sum_out	(sum_out[7]	),
		.c_out		(c_out		)
);

endmodule


