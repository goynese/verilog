
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

