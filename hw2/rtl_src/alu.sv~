module alu(
      input        [15:0] in_a     ,   //input a
      input        [15:0] in_b     ,   //input b
      input        [3:0]  in_opcode,   //opcode input
      output       [15:0] out_y    ,   //alu output
      output              out_zero ,   //logic '1' when o_y is all zeros
      output              out_carry    //indicates a carry out from ALU 
      );

	reg [16:0] rout_y;
	reg rout_zero;

always @(in_a, in_b, in_opcode)
begin
	case (in_opcode)
		4'h1 : rout_y = in_a + in_b;	// in_a + in_b
		4'h2 : rout_y = in_a - in_b;	// in_a - in_b
		4'h3 : rout_y = in_a + 1;	// in_a + 1
		4'h4 : rout_y = in_a - 1;	// in_a - 1
		4'h5 : rout_y = in_a | in_b;	// in_a OR in_b
		4'h6 : rout_y = in_a & in_b;	// in_a AND in_b
		4'h7 : rout_y = in_a ^ in_b;	// in_a XOR in_b
		4'h8 : rout_y = in_a >> 1;	// in_a is shifted one place right, sign bit shifted in to MSB
		4'h9 : rout_y = in_a << 1;	// in_a is shifted one place left, zero shifted in
		4'hA: rout_y = ~in_a;		// in_a gets "ones complemented"
		4'hB: rout_y = ~in_a + 1;	// in_a gets "twos complemented"
	default : rout_y = 0;
	endcase
end

	assign out_carry = rout_y[16:0];
	assign out_y = rout_y[15:0];
	assign out_zero = rout_y^^16'hFFFF;

endmodule

