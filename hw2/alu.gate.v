
module alu_DW01_addsub_0 ( A, B, CI, ADD_SUB, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI, ADD_SUB;
  output CO;

  wire   [16:0] carry;
  wire   [15:0] B_AS;
  assign carry[0] = ADD_SUB;

  XOR3X1 U1_15 ( .IN1(A[15]), .IN2(B_AS[15]), .IN3(carry[15]), .Q(SUM[15]) );
  FADDX1 U1_14 ( .A(A[14]), .B(B_AS[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  FADDX1 U1_13 ( .A(A[13]), .B(B_AS[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  FADDX1 U1_12 ( .A(A[12]), .B(B_AS[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  FADDX1 U1_11 ( .A(A[11]), .B(B_AS[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  FADDX1 U1_10 ( .A(A[10]), .B(B_AS[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FADDX1 U1_9 ( .A(A[9]), .B(B_AS[9]), .CI(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  FADDX1 U1_8 ( .A(A[8]), .B(B_AS[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  FADDX1 U1_7 ( .A(A[7]), .B(B_AS[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  FADDX1 U1_6 ( .A(A[6]), .B(B_AS[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  FADDX1 U1_5 ( .A(A[5]), .B(B_AS[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  FADDX1 U1_4 ( .A(A[4]), .B(B_AS[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  FADDX1 U1_3 ( .A(A[3]), .B(B_AS[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  FADDX1 U1_2 ( .A(A[2]), .B(B_AS[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  FADDX1 U1_1 ( .A(A[1]), .B(B_AS[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  FADDX1 U1_0 ( .A(A[0]), .B(B_AS[0]), .CI(carry[0]), .CO(carry[1]), .S(SUM[0]) );
  XOR2X1 U1 ( .IN1(B[9]), .IN2(carry[0]), .Q(B_AS[9]) );
  XOR2X1 U2 ( .IN1(B[8]), .IN2(carry[0]), .Q(B_AS[8]) );
  XOR2X1 U3 ( .IN1(B[7]), .IN2(carry[0]), .Q(B_AS[7]) );
  XOR2X1 U4 ( .IN1(B[6]), .IN2(carry[0]), .Q(B_AS[6]) );
  XOR2X1 U5 ( .IN1(B[5]), .IN2(carry[0]), .Q(B_AS[5]) );
  XOR2X1 U6 ( .IN1(B[4]), .IN2(carry[0]), .Q(B_AS[4]) );
  XOR2X1 U7 ( .IN1(B[3]), .IN2(carry[0]), .Q(B_AS[3]) );
  XOR2X1 U8 ( .IN1(B[2]), .IN2(carry[0]), .Q(B_AS[2]) );
  XOR2X1 U9 ( .IN1(B[1]), .IN2(carry[0]), .Q(B_AS[1]) );
  XOR2X1 U10 ( .IN1(B[15]), .IN2(carry[0]), .Q(B_AS[15]) );
  XOR2X1 U11 ( .IN1(B[14]), .IN2(carry[0]), .Q(B_AS[14]) );
  XOR2X1 U12 ( .IN1(B[13]), .IN2(carry[0]), .Q(B_AS[13]) );
  XOR2X1 U13 ( .IN1(B[12]), .IN2(carry[0]), .Q(B_AS[12]) );
  XOR2X1 U14 ( .IN1(B[11]), .IN2(carry[0]), .Q(B_AS[11]) );
  XOR2X1 U15 ( .IN1(B[10]), .IN2(carry[0]), .Q(B_AS[10]) );
  XOR2X1 U16 ( .IN1(B[0]), .IN2(carry[0]), .Q(B_AS[0]) );
endmodule


module alu ( in_a, in_b, in_opcode, out_y, out_zero, out_carry );
  input [15:0] in_a;
  input [15:0] in_b;
  input [3:0] in_opcode;
  output [15:0] out_y;
  output out_zero, out_carry;
  wire   N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N119, N120, N121,
         N122, N123, N124, N125, N126, N127, N128, N129, N130, N131, N132,
         N133, N134, N135, N136, N137, N138, N139, N140, N141, N142, N143,
         N144, N145, N146, N147, N148, N149, N150, N151, N152, N153, N154,
         N155, N156, N157, N158, N159, N160, N161, N162, N163, \U3/U1/Z_0 ,
         \U3/U1/Z_1 , \U3/U1/Z_2 , \U3/U1/Z_3 , \U3/U1/Z_4 , \U3/U1/Z_5 ,
         \U3/U1/Z_6 , \U3/U1/Z_7 , \U3/U1/Z_8 , \U3/U1/Z_9 , \U3/U1/Z_10 ,
         \U3/U1/Z_11 , \U3/U1/Z_12 , \U3/U1/Z_13 , \U3/U1/Z_14 , \U3/U1/Z_15 ,
         \U3/U2/Z_0 , \U3/U2/Z_1 , \U3/U2/Z_2 , \U3/U2/Z_3 , \U3/U2/Z_4 ,
         \U3/U2/Z_5 , \U3/U2/Z_6 , \U3/U2/Z_7 , \U3/U2/Z_8 , \U3/U2/Z_9 ,
         \U3/U2/Z_10 , \U3/U2/Z_11 , \U3/U2/Z_12 , \U3/U2/Z_13 , \U3/U2/Z_14 ,
         \U3/U2/Z_15 , \U3/U3/Z_0 , n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216;
  assign out_carry = out_y[0];
  assign out_zero = out_y[0];

  alu_DW01_addsub_0 r31 ( .A({\U3/U1/Z_15 , \U3/U1/Z_14 , \U3/U1/Z_13 , 
        \U3/U1/Z_12 , \U3/U1/Z_11 , \U3/U1/Z_10 , \U3/U1/Z_9 , \U3/U1/Z_8 , 
        \U3/U1/Z_7 , \U3/U1/Z_6 , \U3/U1/Z_5 , \U3/U1/Z_4 , \U3/U1/Z_3 , 
        \U3/U1/Z_2 , \U3/U1/Z_1 , \U3/U1/Z_0 }), .B({\U3/U2/Z_15 , 
        \U3/U2/Z_14 , \U3/U2/Z_13 , \U3/U2/Z_12 , \U3/U2/Z_11 , \U3/U2/Z_10 , 
        \U3/U2/Z_9 , \U3/U2/Z_8 , \U3/U2/Z_7 , \U3/U2/Z_6 , \U3/U2/Z_5 , 
        \U3/U2/Z_4 , \U3/U2/Z_3 , \U3/U2/Z_2 , \U3/U2/Z_1 , \U3/U2/Z_0 }), 
        .CI(1'b0), .ADD_SUB(\U3/U3/Z_0 ), .SUM({N115, N114, N113, N112, N111, 
        N110, N109, N108, N107, N106, N105, N104, N103, N102, N101, N100}) );
  AND2X1 U132 ( .IN1(N115), .IN2(n91), .Q(n90) );
  OR2X1 U133 ( .IN1(in_opcode[0]), .IN2(in_opcode[1]), .Q(n91) );
  MUX41X1 U134 ( .IN1(in_a[2]), .IN3(n215), .IN2(in_a[0]), .IN4(N101), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n95) );
  MUX41X1 U135 ( .IN1(in_a[3]), .IN3(n214), .IN2(in_a[1]), .IN4(N102), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n100) );
  MUX41X1 U136 ( .IN1(in_a[4]), .IN3(n213), .IN2(in_a[2]), .IN4(N103), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n105) );
  MUX41X1 U137 ( .IN1(in_a[5]), .IN3(n212), .IN2(in_a[3]), .IN4(N104), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n110) );
  MUX41X1 U138 ( .IN1(in_a[6]), .IN3(n211), .IN2(in_a[4]), .IN4(N105), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n115) );
  MUX41X1 U139 ( .IN1(in_a[7]), .IN3(n210), .IN2(in_a[5]), .IN4(N106), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n120) );
  MUX41X1 U140 ( .IN1(in_a[8]), .IN3(n209), .IN2(in_a[6]), .IN4(N107), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n125) );
  MUX41X1 U141 ( .IN1(in_a[9]), .IN3(n208), .IN2(in_a[7]), .IN4(N108), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n130) );
  MUX41X1 U142 ( .IN1(in_a[10]), .IN3(n207), .IN2(in_a[8]), .IN4(N109), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n135) );
  MUX41X1 U143 ( .IN1(in_a[11]), .IN3(n206), .IN2(in_a[9]), .IN4(N110), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n140) );
  MUX41X1 U144 ( .IN1(in_a[12]), .IN3(n205), .IN2(in_a[10]), .IN4(N111), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n145) );
  MUX41X1 U145 ( .IN1(in_a[13]), .IN3(n204), .IN2(in_a[11]), .IN4(N112), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n150) );
  MUX41X1 U146 ( .IN1(in_a[14]), .IN3(n203), .IN2(in_a[12]), .IN4(N113), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n155) );
  MUX41X1 U147 ( .IN1(in_a[15]), .IN3(n202), .IN2(in_a[13]), .IN4(N114), .S0(
        in_opcode[1]), .S1(in_opcode[0]), .Q(n160) );
  MUX41X1 U148 ( .IN1(N100), .IN3(N131), .IN2(N147), .IN4(N163), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n170) );
  MUX41X1 U149 ( .IN1(N101), .IN3(N130), .IN2(N146), .IN4(N162), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n99) );
  MUX41X1 U150 ( .IN1(N102), .IN3(N129), .IN2(N145), .IN4(N161), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n104) );
  MUX41X1 U151 ( .IN1(N103), .IN3(N128), .IN2(N144), .IN4(N160), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n109) );
  MUX41X1 U152 ( .IN1(N104), .IN3(N127), .IN2(N143), .IN4(N159), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n114) );
  MUX41X1 U153 ( .IN1(N105), .IN3(N126), .IN2(N142), .IN4(N158), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n119) );
  MUX41X1 U154 ( .IN1(N106), .IN3(N125), .IN2(N141), .IN4(N157), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n124) );
  MUX41X1 U155 ( .IN1(N107), .IN3(N124), .IN2(N140), .IN4(N156), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n129) );
  MUX41X1 U156 ( .IN1(N108), .IN3(N123), .IN2(N139), .IN4(N155), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n134) );
  MUX41X1 U157 ( .IN1(N109), .IN3(N122), .IN2(N138), .IN4(N154), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n139) );
  MUX41X1 U158 ( .IN1(N110), .IN3(N121), .IN2(N137), .IN4(N153), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n144) );
  MUX41X1 U159 ( .IN1(N111), .IN3(N120), .IN2(N136), .IN4(N152), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n149) );
  MUX41X1 U160 ( .IN1(N112), .IN3(N119), .IN2(N135), .IN4(N151), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n154) );
  MUX41X1 U161 ( .IN1(N113), .IN3(N118), .IN2(N134), .IN4(N150), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n159) );
  MUX41X1 U162 ( .IN1(N114), .IN3(N117), .IN2(N133), .IN4(N149), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n164) );
  MUX41X1 U163 ( .IN1(N115), .IN3(N116), .IN2(N132), .IN4(N148), .S0(
        in_opcode[0]), .S1(in_opcode[1]), .Q(n94) );
  MUX21X1 U164 ( .IN1(n168), .IN2(n169), .S(in_opcode[2]), .Q(out_y[0]) );
  MUX21X1 U165 ( .IN1(n166), .IN2(N100), .S(n165), .Q(n168) );
  AND2X1 U166 ( .IN1(n170), .IN2(n171), .Q(n169) );
  MUX21X1 U167 ( .IN1(in_opcode[1]), .IN2(n171), .S(n86), .Q(n165) );
  AND2X1 U168 ( .IN1(in_opcode[1]), .IN2(n201), .Q(n88) );
  INVX0 U169 ( .IN(in_opcode[3]), .QN(n171) );
  AND2X1 U170 ( .IN1(n167), .IN2(n86), .Q(n166) );
  MUX21X1 U171 ( .IN1(in_a[1]), .IN2(n216), .S(in_opcode[1]), .Q(n167) );
  MUX21X1 U172 ( .IN1(in_a[14]), .IN2(N115), .S(in_opcode[1]), .Q(n87) );
  MUX21X1 U173 ( .IN1(n97), .IN2(n98), .S(in_opcode[2]), .Q(out_y[1]) );
  MUX21X1 U174 ( .IN1(n96), .IN2(n95), .S(in_opcode[3]), .Q(n97) );
  AND2X1 U175 ( .IN1(n99), .IN2(n171), .Q(n98) );
  AND2X1 U176 ( .IN1(N101), .IN2(n91), .Q(n96) );
  MUX21X1 U177 ( .IN1(n102), .IN2(n103), .S(in_opcode[2]), .Q(out_y[2]) );
  MUX21X1 U178 ( .IN1(n101), .IN2(n100), .S(in_opcode[3]), .Q(n102) );
  AND2X1 U179 ( .IN1(n104), .IN2(n171), .Q(n103) );
  AND2X1 U180 ( .IN1(N102), .IN2(n91), .Q(n101) );
  MUX21X1 U181 ( .IN1(n107), .IN2(n108), .S(in_opcode[2]), .Q(out_y[3]) );
  MUX21X1 U182 ( .IN1(n106), .IN2(n105), .S(in_opcode[3]), .Q(n107) );
  AND2X1 U183 ( .IN1(n109), .IN2(n171), .Q(n108) );
  AND2X1 U184 ( .IN1(N103), .IN2(n91), .Q(n106) );
  MUX21X1 U185 ( .IN1(n112), .IN2(n113), .S(in_opcode[2]), .Q(out_y[4]) );
  MUX21X1 U186 ( .IN1(n111), .IN2(n110), .S(in_opcode[3]), .Q(n112) );
  AND2X1 U187 ( .IN1(n114), .IN2(n171), .Q(n113) );
  AND2X1 U188 ( .IN1(N104), .IN2(n91), .Q(n111) );
  MUX21X1 U189 ( .IN1(n117), .IN2(n118), .S(in_opcode[2]), .Q(out_y[5]) );
  MUX21X1 U190 ( .IN1(n116), .IN2(n115), .S(in_opcode[3]), .Q(n117) );
  AND2X1 U191 ( .IN1(n119), .IN2(n171), .Q(n118) );
  AND2X1 U192 ( .IN1(N105), .IN2(n91), .Q(n116) );
  MUX21X1 U193 ( .IN1(n122), .IN2(n123), .S(in_opcode[2]), .Q(out_y[6]) );
  MUX21X1 U194 ( .IN1(n121), .IN2(n120), .S(in_opcode[3]), .Q(n122) );
  AND2X1 U195 ( .IN1(n124), .IN2(n171), .Q(n123) );
  AND2X1 U196 ( .IN1(N106), .IN2(n91), .Q(n121) );
  MUX21X1 U197 ( .IN1(n127), .IN2(n128), .S(in_opcode[2]), .Q(out_y[7]) );
  MUX21X1 U198 ( .IN1(n126), .IN2(n125), .S(in_opcode[3]), .Q(n127) );
  AND2X1 U199 ( .IN1(n129), .IN2(n171), .Q(n128) );
  AND2X1 U200 ( .IN1(N107), .IN2(n91), .Q(n126) );
  MUX21X1 U201 ( .IN1(n132), .IN2(n133), .S(in_opcode[2]), .Q(out_y[8]) );
  MUX21X1 U202 ( .IN1(n131), .IN2(n130), .S(in_opcode[3]), .Q(n132) );
  AND2X1 U203 ( .IN1(n134), .IN2(n171), .Q(n133) );
  AND2X1 U204 ( .IN1(N108), .IN2(n91), .Q(n131) );
  MUX21X1 U205 ( .IN1(n137), .IN2(n138), .S(in_opcode[2]), .Q(out_y[9]) );
  MUX21X1 U206 ( .IN1(n136), .IN2(n135), .S(in_opcode[3]), .Q(n137) );
  AND2X1 U207 ( .IN1(n139), .IN2(n171), .Q(n138) );
  AND2X1 U208 ( .IN1(N109), .IN2(n91), .Q(n136) );
  MUX21X1 U209 ( .IN1(n142), .IN2(n143), .S(in_opcode[2]), .Q(out_y[10]) );
  MUX21X1 U210 ( .IN1(n141), .IN2(n140), .S(in_opcode[3]), .Q(n142) );
  AND2X1 U211 ( .IN1(n144), .IN2(n171), .Q(n143) );
  AND2X1 U212 ( .IN1(N110), .IN2(n91), .Q(n141) );
  MUX21X1 U213 ( .IN1(n147), .IN2(n148), .S(in_opcode[2]), .Q(out_y[11]) );
  MUX21X1 U214 ( .IN1(n146), .IN2(n145), .S(in_opcode[3]), .Q(n147) );
  AND2X1 U215 ( .IN1(n149), .IN2(n171), .Q(n148) );
  AND2X1 U216 ( .IN1(N111), .IN2(n91), .Q(n146) );
  MUX21X1 U217 ( .IN1(n152), .IN2(n153), .S(in_opcode[2]), .Q(out_y[12]) );
  MUX21X1 U218 ( .IN1(n151), .IN2(n150), .S(in_opcode[3]), .Q(n152) );
  AND2X1 U219 ( .IN1(n154), .IN2(n171), .Q(n153) );
  AND2X1 U220 ( .IN1(N112), .IN2(n91), .Q(n151) );
  MUX21X1 U221 ( .IN1(n157), .IN2(n158), .S(in_opcode[2]), .Q(out_y[13]) );
  MUX21X1 U222 ( .IN1(n156), .IN2(n155), .S(in_opcode[3]), .Q(n157) );
  AND2X1 U223 ( .IN1(n159), .IN2(n171), .Q(n158) );
  AND2X1 U224 ( .IN1(N113), .IN2(n91), .Q(n156) );
  MUX21X1 U225 ( .IN1(n162), .IN2(n163), .S(in_opcode[2]), .Q(out_y[14]) );
  MUX21X1 U226 ( .IN1(n161), .IN2(n160), .S(in_opcode[3]), .Q(n162) );
  AND2X1 U227 ( .IN1(n164), .IN2(n171), .Q(n163) );
  AND2X1 U228 ( .IN1(N114), .IN2(n91), .Q(n161) );
  MUX21X1 U229 ( .IN1(n92), .IN2(n93), .S(in_opcode[2]), .Q(out_y[15]) );
  MUX21X1 U230 ( .IN1(n90), .IN2(n89), .S(in_opcode[3]), .Q(n92) );
  AND2X1 U231 ( .IN1(n94), .IN2(n171), .Q(n93) );
  MUX21X1 U232 ( .IN1(n88), .IN2(n87), .S(in_opcode[0]), .Q(n89) );
  XOR2X1 U233 ( .IN1(in_opcode[0]), .IN2(in_opcode[3]), .Q(n86) );
  NAND3X0 U234 ( .IN1(n172), .IN2(n173), .IN3(n174), .QN(\U3/U3/Z_0 ) );
  NAND4X0 U235 ( .IN1(in_opcode[1]), .IN2(n175), .IN3(n176), .IN4(n171), .QN(
        n174) );
  AO22X1 U236 ( .IN1(in_b[9]), .IN2(n177), .IN3(n178), .IN4(in_a[9]), .Q(
        \U3/U2/Z_9 ) );
  AO22X1 U237 ( .IN1(in_b[8]), .IN2(n177), .IN3(n178), .IN4(in_a[8]), .Q(
        \U3/U2/Z_8 ) );
  AO22X1 U238 ( .IN1(in_b[7]), .IN2(n177), .IN3(n178), .IN4(in_a[7]), .Q(
        \U3/U2/Z_7 ) );
  AO22X1 U239 ( .IN1(in_b[6]), .IN2(n177), .IN3(n178), .IN4(in_a[6]), .Q(
        \U3/U2/Z_6 ) );
  AO22X1 U240 ( .IN1(in_b[5]), .IN2(n177), .IN3(n178), .IN4(in_a[5]), .Q(
        \U3/U2/Z_5 ) );
  AO22X1 U241 ( .IN1(in_b[4]), .IN2(n177), .IN3(n178), .IN4(in_a[4]), .Q(
        \U3/U2/Z_4 ) );
  AO22X1 U242 ( .IN1(in_b[3]), .IN2(n177), .IN3(n178), .IN4(in_a[3]), .Q(
        \U3/U2/Z_3 ) );
  AO22X1 U243 ( .IN1(in_b[2]), .IN2(n177), .IN3(n178), .IN4(in_a[2]), .Q(
        \U3/U2/Z_2 ) );
  AO22X1 U244 ( .IN1(in_b[15]), .IN2(n177), .IN3(n178), .IN4(in_a[15]), .Q(
        \U3/U2/Z_15 ) );
  AO22X1 U245 ( .IN1(in_b[14]), .IN2(n177), .IN3(n178), .IN4(in_a[14]), .Q(
        \U3/U2/Z_14 ) );
  AO22X1 U246 ( .IN1(in_b[13]), .IN2(n177), .IN3(n178), .IN4(in_a[13]), .Q(
        \U3/U2/Z_13 ) );
  AO22X1 U247 ( .IN1(in_b[12]), .IN2(n177), .IN3(n178), .IN4(in_a[12]), .Q(
        \U3/U2/Z_12 ) );
  AO22X1 U248 ( .IN1(in_b[11]), .IN2(n177), .IN3(n178), .IN4(in_a[11]), .Q(
        \U3/U2/Z_11 ) );
  AO22X1 U249 ( .IN1(in_b[10]), .IN2(n177), .IN3(n178), .IN4(in_a[10]), .Q(
        \U3/U2/Z_10 ) );
  AO22X1 U250 ( .IN1(in_b[1]), .IN2(n177), .IN3(n178), .IN4(in_a[1]), .Q(
        \U3/U2/Z_1 ) );
  AO221X1 U251 ( .IN1(n178), .IN2(in_a[0]), .IN3(in_b[0]), .IN4(n177), .IN5(
        n179), .Q(\U3/U2/Z_0 ) );
  NAND2X0 U252 ( .IN1(n180), .IN2(n173), .QN(n179) );
  INVX0 U253 ( .IN(n181), .QN(n177) );
  INVX0 U254 ( .IN(n172), .QN(n178) );
  NAND2X0 U255 ( .IN1(in_opcode[3]), .IN2(n182), .QN(n172) );
  NOR2X0 U256 ( .IN1(n207), .IN2(n183), .QN(\U3/U1/Z_9 ) );
  NOR2X0 U257 ( .IN1(n208), .IN2(n183), .QN(\U3/U1/Z_8 ) );
  NOR2X0 U258 ( .IN1(n209), .IN2(n183), .QN(\U3/U1/Z_7 ) );
  NOR2X0 U259 ( .IN1(n210), .IN2(n183), .QN(\U3/U1/Z_6 ) );
  NOR2X0 U260 ( .IN1(n211), .IN2(n183), .QN(\U3/U1/Z_5 ) );
  NOR2X0 U261 ( .IN1(n212), .IN2(n183), .QN(\U3/U1/Z_4 ) );
  NOR2X0 U262 ( .IN1(n213), .IN2(n183), .QN(\U3/U1/Z_3 ) );
  NOR2X0 U263 ( .IN1(n214), .IN2(n183), .QN(\U3/U1/Z_2 ) );
  NOR2X0 U264 ( .IN1(n201), .IN2(n183), .QN(\U3/U1/Z_15 ) );
  NOR2X0 U265 ( .IN1(n202), .IN2(n183), .QN(\U3/U1/Z_14 ) );
  NOR2X0 U266 ( .IN1(n203), .IN2(n183), .QN(\U3/U1/Z_13 ) );
  NOR2X0 U267 ( .IN1(n204), .IN2(n183), .QN(\U3/U1/Z_12 ) );
  NOR2X0 U268 ( .IN1(n205), .IN2(n183), .QN(\U3/U1/Z_11 ) );
  NOR2X0 U269 ( .IN1(n206), .IN2(n183), .QN(\U3/U1/Z_10 ) );
  NOR2X0 U270 ( .IN1(n215), .IN2(n183), .QN(\U3/U1/Z_1 ) );
  NOR2X0 U271 ( .IN1(n216), .IN2(n183), .QN(\U3/U1/Z_0 ) );
  AND3X1 U272 ( .IN1(n173), .IN2(n181), .IN3(n180), .Q(n183) );
  NAND2X0 U273 ( .IN1(n182), .IN2(n171), .QN(n180) );
  AND3X1 U274 ( .IN1(in_opcode[0]), .IN2(n176), .IN3(in_opcode[1]), .Q(n182)
         );
  NAND3X0 U275 ( .IN1(n176), .IN2(n171), .IN3(n184), .QN(n181) );
  XNOR2X1 U276 ( .IN1(in_opcode[1]), .IN2(n175), .Q(n184) );
  INVX0 U277 ( .IN(in_opcode[0]), .QN(n175) );
  OR4X1 U278 ( .IN1(n176), .IN2(in_opcode[0]), .IN3(in_opcode[1]), .IN4(
        in_opcode[3]), .Q(n173) );
  INVX0 U279 ( .IN(in_opcode[2]), .QN(n176) );
  XNOR2X1 U280 ( .IN1(n185), .IN2(in_a[0]), .Q(N163) );
  XNOR2X1 U281 ( .IN1(n186), .IN2(in_a[1]), .Q(N162) );
  XNOR2X1 U282 ( .IN1(n187), .IN2(in_a[2]), .Q(N161) );
  XNOR2X1 U283 ( .IN1(n188), .IN2(in_a[3]), .Q(N160) );
  XNOR2X1 U284 ( .IN1(n189), .IN2(in_a[4]), .Q(N159) );
  XNOR2X1 U285 ( .IN1(n190), .IN2(in_a[5]), .Q(N158) );
  XNOR2X1 U286 ( .IN1(n191), .IN2(in_a[6]), .Q(N157) );
  XNOR2X1 U287 ( .IN1(n192), .IN2(in_a[7]), .Q(N156) );
  XNOR2X1 U288 ( .IN1(n193), .IN2(in_a[8]), .Q(N155) );
  XNOR2X1 U289 ( .IN1(n194), .IN2(in_a[9]), .Q(N154) );
  XNOR2X1 U290 ( .IN1(n195), .IN2(in_a[10]), .Q(N153) );
  XNOR2X1 U291 ( .IN1(n196), .IN2(in_a[11]), .Q(N152) );
  XNOR2X1 U292 ( .IN1(n197), .IN2(in_a[12]), .Q(N151) );
  XNOR2X1 U293 ( .IN1(n198), .IN2(in_a[13]), .Q(N150) );
  XNOR2X1 U294 ( .IN1(n199), .IN2(in_a[14]), .Q(N149) );
  XNOR2X1 U295 ( .IN1(n200), .IN2(in_a[15]), .Q(N148) );
  NOR2X0 U296 ( .IN1(n216), .IN2(n185), .QN(N147) );
  NOR2X0 U297 ( .IN1(n215), .IN2(n186), .QN(N146) );
  NOR2X0 U298 ( .IN1(n214), .IN2(n187), .QN(N145) );
  NOR2X0 U299 ( .IN1(n213), .IN2(n188), .QN(N144) );
  NOR2X0 U300 ( .IN1(n212), .IN2(n189), .QN(N143) );
  NOR2X0 U301 ( .IN1(n211), .IN2(n190), .QN(N142) );
  NOR2X0 U302 ( .IN1(n210), .IN2(n191), .QN(N141) );
  NOR2X0 U303 ( .IN1(n209), .IN2(n192), .QN(N140) );
  NOR2X0 U304 ( .IN1(n208), .IN2(n193), .QN(N139) );
  NOR2X0 U305 ( .IN1(n207), .IN2(n194), .QN(N138) );
  NOR2X0 U306 ( .IN1(n206), .IN2(n195), .QN(N137) );
  NOR2X0 U307 ( .IN1(n205), .IN2(n196), .QN(N136) );
  NOR2X0 U308 ( .IN1(n204), .IN2(n197), .QN(N135) );
  NOR2X0 U309 ( .IN1(n203), .IN2(n198), .QN(N134) );
  NOR2X0 U310 ( .IN1(n202), .IN2(n199), .QN(N133) );
  NOR2X0 U311 ( .IN1(n201), .IN2(n200), .QN(N132) );
  NAND2X0 U312 ( .IN1(n185), .IN2(n216), .QN(N131) );
  INVX0 U313 ( .IN(in_a[0]), .QN(n216) );
  INVX0 U314 ( .IN(in_b[0]), .QN(n185) );
  NAND2X0 U315 ( .IN1(n186), .IN2(n215), .QN(N130) );
  INVX0 U316 ( .IN(in_a[1]), .QN(n215) );
  INVX0 U317 ( .IN(in_b[1]), .QN(n186) );
  NAND2X0 U318 ( .IN1(n187), .IN2(n214), .QN(N129) );
  INVX0 U319 ( .IN(in_a[2]), .QN(n214) );
  INVX0 U320 ( .IN(in_b[2]), .QN(n187) );
  NAND2X0 U321 ( .IN1(n188), .IN2(n213), .QN(N128) );
  INVX0 U322 ( .IN(in_a[3]), .QN(n213) );
  INVX0 U323 ( .IN(in_b[3]), .QN(n188) );
  NAND2X0 U324 ( .IN1(n189), .IN2(n212), .QN(N127) );
  INVX0 U325 ( .IN(in_a[4]), .QN(n212) );
  INVX0 U326 ( .IN(in_b[4]), .QN(n189) );
  NAND2X0 U327 ( .IN1(n190), .IN2(n211), .QN(N126) );
  INVX0 U328 ( .IN(in_a[5]), .QN(n211) );
  INVX0 U329 ( .IN(in_b[5]), .QN(n190) );
  NAND2X0 U330 ( .IN1(n191), .IN2(n210), .QN(N125) );
  INVX0 U331 ( .IN(in_a[6]), .QN(n210) );
  INVX0 U332 ( .IN(in_b[6]), .QN(n191) );
  NAND2X0 U333 ( .IN1(n192), .IN2(n209), .QN(N124) );
  INVX0 U334 ( .IN(in_a[7]), .QN(n209) );
  INVX0 U335 ( .IN(in_b[7]), .QN(n192) );
  NAND2X0 U336 ( .IN1(n193), .IN2(n208), .QN(N123) );
  INVX0 U337 ( .IN(in_a[8]), .QN(n208) );
  INVX0 U338 ( .IN(in_b[8]), .QN(n193) );
  NAND2X0 U339 ( .IN1(n194), .IN2(n207), .QN(N122) );
  INVX0 U340 ( .IN(in_a[9]), .QN(n207) );
  INVX0 U341 ( .IN(in_b[9]), .QN(n194) );
  NAND2X0 U342 ( .IN1(n195), .IN2(n206), .QN(N121) );
  INVX0 U343 ( .IN(in_a[10]), .QN(n206) );
  INVX0 U344 ( .IN(in_b[10]), .QN(n195) );
  NAND2X0 U345 ( .IN1(n196), .IN2(n205), .QN(N120) );
  INVX0 U346 ( .IN(in_a[11]), .QN(n205) );
  INVX0 U347 ( .IN(in_b[11]), .QN(n196) );
  NAND2X0 U348 ( .IN1(n197), .IN2(n204), .QN(N119) );
  INVX0 U349 ( .IN(in_a[12]), .QN(n204) );
  INVX0 U350 ( .IN(in_b[12]), .QN(n197) );
  NAND2X0 U351 ( .IN1(n198), .IN2(n203), .QN(N118) );
  INVX0 U352 ( .IN(in_a[13]), .QN(n203) );
  INVX0 U353 ( .IN(in_b[13]), .QN(n198) );
  NAND2X0 U354 ( .IN1(n199), .IN2(n202), .QN(N117) );
  INVX0 U355 ( .IN(in_a[14]), .QN(n202) );
  INVX0 U356 ( .IN(in_b[14]), .QN(n199) );
  NAND2X0 U357 ( .IN1(n200), .IN2(n201), .QN(N116) );
  INVX0 U358 ( .IN(in_a[15]), .QN(n201) );
  INVX0 U359 ( .IN(in_b[15]), .QN(n200) );
endmodule

