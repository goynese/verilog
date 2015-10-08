
module fadder ( a, b, cin, sum_out, c_out );
  input a, b, cin;
  output sum_out, c_out;
  wire   c1, c2, c3, N0, N1;

  GTECH_AND2 C6 ( .A(a), .B(b), .Z(c3) );
  GTECH_AND2 C7 ( .A(a), .B(cin), .Z(c1) );
  GTECH_AND2 C8 ( .A(b), .B(cin), .Z(c2) );
  GTECH_XOR2 C9 ( .A(c1), .B(c2), .Z(N0) );
  GTECH_XOR2 C10 ( .A(N0), .B(c3), .Z(c_out) );
  GTECH_XOR2 C12 ( .A(N1), .B(cin), .Z(sum_out) );
  GTECH_XOR2 C13 ( .A(a), .B(b), .Z(N1) );
endmodule


module adder8 ( a, b, sum_out, c_out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] sum_out;
  output c_out;
  wire   c0, c1, c2, c3, c4, c5, c6;

  fadder bit0 ( .a(a[0]), .b(b[0]), .cin(1'b0), .sum_out(sum_out[0]), .c_out(
        c0) );
  fadder bit1 ( .a(a[1]), .b(b[1]), .cin(c0), .sum_out(sum_out[1]), .c_out(c1)
         );
  fadder bit2 ( .a(a[2]), .b(b[2]), .cin(c1), .sum_out(sum_out[2]), .c_out(c2)
         );
  fadder bit3 ( .a(a[3]), .b(b[3]), .cin(c2), .sum_out(sum_out[3]), .c_out(c3)
         );
  fadder bit4 ( .a(a[4]), .b(b[4]), .cin(c3), .sum_out(sum_out[4]), .c_out(c4)
         );
  fadder bit5 ( .a(a[5]), .b(b[5]), .cin(c4), .sum_out(sum_out[5]), .c_out(c5)
         );
  fadder bit6 ( .a(a[6]), .b(b[6]), .cin(c5), .sum_out(sum_out[6]), .c_out(c6)
         );
  fadder bit7 ( .a(a[7]), .b(b[7]), .cin(c6), .sum_out(sum_out[7]), .c_out(
        c_out) );
endmodule

