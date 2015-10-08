
module fadder ( a, b, cin, sum_out, c_out );
  input a, b, cin;
  output sum_out, c_out;


  FADDX1 U3 ( .A(a), .B(b), .CI(cin), .CO(c_out), .S(sum_out) );
endmodule

