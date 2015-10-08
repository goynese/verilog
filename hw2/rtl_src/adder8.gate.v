
module alu ( in_a, in_b, in_opcode, out_y, out_zero, out_carry );
  input [15:0] in_a;
  input [15:0] in_b;
  input [3:0] in_opcode;
  output [15:0] out_y;
  output out_zero, out_carry;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99,
         N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N119, N120, N121,
         N122, N123, N124, N125, N126, N127, N128, N129, N130, N131, N132,
         N133, N134, N135, N136, N137, N138, N139, N140, N141, N142, N143,
         N144, N145, N146, N147, N148, N149, N150, N151, N152, N153, N154,
         N155, N156, N157, N158, N159, N160, N161, N162, N163, N164, N165,
         N166, N167, N168, N169, N170, N171, N172, N173, N174, N175, N176,
         N177, N178, N179, N180, N181, N182, N183, N184, N185, N186, N187,
         N188, N189, N190, N191, N192, N193, N194, N195, N196, N197;
  assign out_carry = out_y[0];
  assign out_zero = out_y[0];

  GTECH_OR2 C5 ( .A(in_opcode[3]), .B(in_opcode[2]), .Z(N14) );
  GTECH_OR2 C7 ( .A(N14), .B(N26), .Z(N15) );
  GTECH_OR2 C12 ( .A(N14), .B(N30), .Z(N17) );
  GTECH_OR2 C18 ( .A(N14), .B(N33), .Z(N19) );
  GTECH_OR2 C23 ( .A(N25), .B(N36), .Z(N21) );
  GTECH_OR2 C27 ( .A(in_opcode[3]), .B(N23), .Z(N25) );
  GTECH_OR2 C28 ( .A(in_opcode[1]), .B(N24), .Z(N26) );
  GTECH_OR2 C29 ( .A(N25), .B(N26), .Z(N27) );
  GTECH_OR2 C34 ( .A(N29), .B(in_opcode[0]), .Z(N30) );
  GTECH_OR2 C35 ( .A(N25), .B(N30), .Z(N31) );
  GTECH_OR2 C41 ( .A(N29), .B(N24), .Z(N33) );
  GTECH_OR2 C42 ( .A(N25), .B(N33), .Z(N34) );
  GTECH_OR2 C46 ( .A(in_opcode[1]), .B(in_opcode[0]), .Z(N36) );
  GTECH_OR2 C47 ( .A(N42), .B(N36), .Z(N37) );
  GTECH_OR2 C53 ( .A(N42), .B(N26), .Z(N39) );
  GTECH_OR2 C57 ( .A(N41), .B(in_opcode[2]), .Z(N42) );
  GTECH_OR2 C59 ( .A(N42), .B(N30), .Z(N43) );
  GTECH_OR2 C66 ( .A(N42), .B(N33), .Z(N45) );
  GTECH_AND2 C68 ( .A(in_opcode[3]), .B(in_opcode[2]), .Z(N47) );
  GTECH_AND2 C73 ( .A(N41), .B(N23), .Z(N48) );
  GTECH_AND2 C74 ( .A(N29), .B(N24), .Z(N49) );
  GTECH_AND2 C75 ( .A(N48), .B(N49), .Z(N50) );
  ADD_UNS_OP add_16 ( .A(in_a), .B(in_b), .Z({N67, N66, N65, N64, N63, N62, 
        N61, N60, N59, N58, N57, N56, N55, N54, N53, N52}) );
  SUB_UNS_OP sub_17 ( .A(in_a), .B(in_b), .Z({N83, N82, N81, N80, N79, N78, 
        N77, N76, N75, N74, N73, N72, N71, N70, N69, N68}) );
  ADD_UNS_OP add_18 ( .A(in_a), .B(1'b1), .Z({N99, N98, N97, N96, N95, N94, 
        N93, N92, N91, N90, N89, N88, N87, N86, N85, N84}) );
  SUB_UNS_OP sub_19 ( .A(in_a), .B(1'b1), .Z({N115, N114, N113, N112, N111, 
        N110, N109, N108, N107, N106, N105, N104, N103, N102, N101, N100}) );
  SUB_UNS_OP sub_add_26_b0 ( .A(1'b0), .B(in_a), .Z({N195, N194, N193, N192, 
        N191, N190, N189, N188, N187, N186, N185, N184, N183, N182, N181, N180}) );
  GTECH_OR2 C199 ( .A(N40), .B(N51), .Z(N196) );
  GTECH_OR2 C201 ( .A(N38), .B(N51), .Z(N197) );
  SELECT_OP C203 ( .DATA1(N52), .DATA2(N68), .DATA3(N84), .DATA4(N100), 
        .DATA5(N131), .DATA6(N147), .DATA7(N163), .DATA8(in_a[1]), .DATA9(1'b0), .DATA10(N179), .DATA11(N180), .CONTROL1(N0), .CONTROL2(N1), .CONTROL3(N2), 
        .CONTROL4(N3), .CONTROL5(N4), .CONTROL6(N5), .CONTROL7(N6), .CONTROL8(
        N7), .CONTROL9(N8), .CONTROL10(N9), .CONTROL11(N10), .Z(out_y[0]) );
  GTECH_BUF B_0 ( .A(N16), .Z(N0) );
  GTECH_BUF B_1 ( .A(N18), .Z(N1) );
  GTECH_BUF B_2 ( .A(N20), .Z(N2) );
  GTECH_BUF B_3 ( .A(N22), .Z(N3) );
  GTECH_BUF B_4 ( .A(N28), .Z(N4) );
  GTECH_BUF B_5 ( .A(N32), .Z(N5) );
  GTECH_BUF B_6 ( .A(N35), .Z(N6) );
  GTECH_BUF B_7 ( .A(N38), .Z(N7) );
  GTECH_BUF B_8 ( .A(N196), .Z(N8) );
  GTECH_BUF B_9 ( .A(N44), .Z(N9) );
  GTECH_BUF B_10 ( .A(N46), .Z(N10) );
  SELECT_OP C204 ( .DATA1({N66, N65, N64, N63, N62, N61, N60, N59, N58, N57, 
        N56, N55, N54, N53}), .DATA2({N82, N81, N80, N79, N78, N77, N76, N75, 
        N74, N73, N72, N71, N70, N69}), .DATA3({N98, N97, N96, N95, N94, N93, 
        N92, N91, N90, N89, N88, N87, N86, N85}), .DATA4({N114, N113, N112, 
        N111, N110, N109, N108, N107, N106, N105, N104, N103, N102, N101}), 
        .DATA5({N117, N118, N119, N120, N121, N122, N123, N124, N125, N126, 
        N127, N128, N129, N130}), .DATA6({N133, N134, N135, N136, N137, N138, 
        N139, N140, N141, N142, N143, N144, N145, N146}), .DATA7({N149, N150, 
        N151, N152, N153, N154, N155, N156, N157, N158, N159, N160, N161, N162}), .DATA8(in_a[15:2]), .DATA9(in_a[13:0]), .DATA10({N165, N166, N167, N168, 
        N169, N170, N171, N172, N173, N174, N175, N176, N177, N178}), .DATA11(
        {N194, N193, N192, N191, N190, N189, N188, N187, N186, N185, N184, 
        N183, N182, N181}), .DATA12({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N0), .CONTROL2(
        N1), .CONTROL3(N2), .CONTROL4(N3), .CONTROL5(N4), .CONTROL6(N5), 
        .CONTROL7(N6), .CONTROL8(N7), .CONTROL9(N11), .CONTROL10(N9), 
        .CONTROL11(N10), .CONTROL12(N12), .Z(out_y[14:1]) );
  GTECH_BUF B_11 ( .A(N40), .Z(N11) );
  GTECH_BUF B_12 ( .A(N51), .Z(N12) );
  SELECT_OP C205 ( .DATA1(N67), .DATA2(N83), .DATA3(N99), .DATA4(N115), 
        .DATA5(N116), .DATA6(N132), .DATA7(N148), .DATA8(1'b0), .DATA9(
        in_a[14]), .DATA10(N164), .DATA11(N195), .CONTROL1(N0), .CONTROL2(N1), 
        .CONTROL3(N2), .CONTROL4(N3), .CONTROL5(N4), .CONTROL6(N5), .CONTROL7(
        N6), .CONTROL8(N13), .CONTROL9(N11), .CONTROL10(N9), .CONTROL11(N10), 
        .Z(out_y[15]) );
  GTECH_BUF B_13 ( .A(N197), .Z(N13) );
  GTECH_NOT I_0 ( .A(N15), .Z(N16) );
  GTECH_NOT I_1 ( .A(N17), .Z(N18) );
  GTECH_NOT I_2 ( .A(N19), .Z(N20) );
  GTECH_NOT I_3 ( .A(N21), .Z(N22) );
  GTECH_NOT I_4 ( .A(in_opcode[2]), .Z(N23) );
  GTECH_NOT I_5 ( .A(in_opcode[0]), .Z(N24) );
  GTECH_NOT I_6 ( .A(N27), .Z(N28) );
  GTECH_NOT I_7 ( .A(in_opcode[1]), .Z(N29) );
  GTECH_NOT I_8 ( .A(N31), .Z(N32) );
  GTECH_NOT I_9 ( .A(N34), .Z(N35) );
  GTECH_NOT I_10 ( .A(N37), .Z(N38) );
  GTECH_NOT I_11 ( .A(N39), .Z(N40) );
  GTECH_NOT I_12 ( .A(in_opcode[3]), .Z(N41) );
  GTECH_NOT I_13 ( .A(N43), .Z(N44) );
  GTECH_NOT I_14 ( .A(N45), .Z(N46) );
  GTECH_OR2 C223 ( .A(N47), .B(N50), .Z(N51) );
  GTECH_BUF B_14 ( .A(N16) );
  GTECH_BUF B_15 ( .A(N18) );
  GTECH_BUF B_16 ( .A(N20) );
  GTECH_BUF B_17 ( .A(N22) );
  GTECH_OR2 C240 ( .A(in_a[15]), .B(in_b[15]), .Z(N116) );
  GTECH_OR2 C241 ( .A(in_a[14]), .B(in_b[14]), .Z(N117) );
  GTECH_OR2 C242 ( .A(in_a[13]), .B(in_b[13]), .Z(N118) );
  GTECH_OR2 C243 ( .A(in_a[12]), .B(in_b[12]), .Z(N119) );
  GTECH_OR2 C244 ( .A(in_a[11]), .B(in_b[11]), .Z(N120) );
  GTECH_OR2 C245 ( .A(in_a[10]), .B(in_b[10]), .Z(N121) );
  GTECH_OR2 C246 ( .A(in_a[9]), .B(in_b[9]), .Z(N122) );
  GTECH_OR2 C247 ( .A(in_a[8]), .B(in_b[8]), .Z(N123) );
  GTECH_OR2 C248 ( .A(in_a[7]), .B(in_b[7]), .Z(N124) );
  GTECH_OR2 C249 ( .A(in_a[6]), .B(in_b[6]), .Z(N125) );
  GTECH_OR2 C250 ( .A(in_a[5]), .B(in_b[5]), .Z(N126) );
  GTECH_OR2 C251 ( .A(in_a[4]), .B(in_b[4]), .Z(N127) );
  GTECH_OR2 C252 ( .A(in_a[3]), .B(in_b[3]), .Z(N128) );
  GTECH_OR2 C253 ( .A(in_a[2]), .B(in_b[2]), .Z(N129) );
  GTECH_OR2 C254 ( .A(in_a[1]), .B(in_b[1]), .Z(N130) );
  GTECH_OR2 C255 ( .A(in_a[0]), .B(in_b[0]), .Z(N131) );
  GTECH_AND2 C256 ( .A(in_a[15]), .B(in_b[15]), .Z(N132) );
  GTECH_AND2 C257 ( .A(in_a[14]), .B(in_b[14]), .Z(N133) );
  GTECH_AND2 C258 ( .A(in_a[13]), .B(in_b[13]), .Z(N134) );
  GTECH_AND2 C259 ( .A(in_a[12]), .B(in_b[12]), .Z(N135) );
  GTECH_AND2 C260 ( .A(in_a[11]), .B(in_b[11]), .Z(N136) );
  GTECH_AND2 C261 ( .A(in_a[10]), .B(in_b[10]), .Z(N137) );
  GTECH_AND2 C262 ( .A(in_a[9]), .B(in_b[9]), .Z(N138) );
  GTECH_AND2 C263 ( .A(in_a[8]), .B(in_b[8]), .Z(N139) );
  GTECH_AND2 C264 ( .A(in_a[7]), .B(in_b[7]), .Z(N140) );
  GTECH_AND2 C265 ( .A(in_a[6]), .B(in_b[6]), .Z(N141) );
  GTECH_AND2 C266 ( .A(in_a[5]), .B(in_b[5]), .Z(N142) );
  GTECH_AND2 C267 ( .A(in_a[4]), .B(in_b[4]), .Z(N143) );
  GTECH_AND2 C268 ( .A(in_a[3]), .B(in_b[3]), .Z(N144) );
  GTECH_AND2 C269 ( .A(in_a[2]), .B(in_b[2]), .Z(N145) );
  GTECH_AND2 C270 ( .A(in_a[1]), .B(in_b[1]), .Z(N146) );
  GTECH_AND2 C271 ( .A(in_a[0]), .B(in_b[0]), .Z(N147) );
  GTECH_XOR2 C272 ( .A(in_a[15]), .B(in_b[15]), .Z(N148) );
  GTECH_XOR2 C273 ( .A(in_a[14]), .B(in_b[14]), .Z(N149) );
  GTECH_XOR2 C274 ( .A(in_a[13]), .B(in_b[13]), .Z(N150) );
  GTECH_XOR2 C275 ( .A(in_a[12]), .B(in_b[12]), .Z(N151) );
  GTECH_XOR2 C276 ( .A(in_a[11]), .B(in_b[11]), .Z(N152) );
  GTECH_XOR2 C277 ( .A(in_a[10]), .B(in_b[10]), .Z(N153) );
  GTECH_XOR2 C278 ( .A(in_a[9]), .B(in_b[9]), .Z(N154) );
  GTECH_XOR2 C279 ( .A(in_a[8]), .B(in_b[8]), .Z(N155) );
  GTECH_XOR2 C280 ( .A(in_a[7]), .B(in_b[7]), .Z(N156) );
  GTECH_XOR2 C281 ( .A(in_a[6]), .B(in_b[6]), .Z(N157) );
  GTECH_XOR2 C282 ( .A(in_a[5]), .B(in_b[5]), .Z(N158) );
  GTECH_XOR2 C283 ( .A(in_a[4]), .B(in_b[4]), .Z(N159) );
  GTECH_XOR2 C284 ( .A(in_a[3]), .B(in_b[3]), .Z(N160) );
  GTECH_XOR2 C285 ( .A(in_a[2]), .B(in_b[2]), .Z(N161) );
  GTECH_XOR2 C286 ( .A(in_a[1]), .B(in_b[1]), .Z(N162) );
  GTECH_XOR2 C287 ( .A(in_a[0]), .B(in_b[0]), .Z(N163) );
  GTECH_NOT I_15 ( .A(in_a[15]), .Z(N164) );
  GTECH_NOT I_16 ( .A(in_a[14]), .Z(N165) );
  GTECH_NOT I_17 ( .A(in_a[13]), .Z(N166) );
  GTECH_NOT I_18 ( .A(in_a[12]), .Z(N167) );
  GTECH_NOT I_19 ( .A(in_a[11]), .Z(N168) );
  GTECH_NOT I_20 ( .A(in_a[10]), .Z(N169) );
  GTECH_NOT I_21 ( .A(in_a[9]), .Z(N170) );
  GTECH_NOT I_22 ( .A(in_a[8]), .Z(N171) );
  GTECH_NOT I_23 ( .A(in_a[7]), .Z(N172) );
  GTECH_NOT I_24 ( .A(in_a[6]), .Z(N173) );
  GTECH_NOT I_25 ( .A(in_a[5]), .Z(N174) );
  GTECH_NOT I_26 ( .A(in_a[4]), .Z(N175) );
  GTECH_NOT I_27 ( .A(in_a[3]), .Z(N176) );
  GTECH_NOT I_28 ( .A(in_a[2]), .Z(N177) );
  GTECH_NOT I_29 ( .A(in_a[1]), .Z(N178) );
  GTECH_NOT I_30 ( .A(in_a[0]), .Z(N179) );
  GTECH_BUF B_18 ( .A(N46) );
endmodule

