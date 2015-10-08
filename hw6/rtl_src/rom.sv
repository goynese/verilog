`timescale 1ns/1ps

module rom (
	input  [3:0] address , // Address Input
	output [7:0] data    , // Data Output
	input        re , // Read Enable 
	input        ce      , // Chip Enable
	input        clk       // Memory Clock
);

reg [7:0] data_a ;
       
assign #17 data = ce ? data_a : 8'hzz;

always_comb
begin
	if(re)
	begin
		case (address)
    		0 :  data_a = 8'b01010101;
    		1 :  data_a = 8'b01011111;
    		2 :  data_a = 8'b01000001;
    		3 :  data_a = 8'b01110101;
    		4 :  data_a = 8'h00;
    		5 :  data_a = 8'hff;
    		6 :  data_a = 8'h11;
    		7 :  data_a = 8'h10;
    		8 :  data_a = 8'h10;
    		9 :  data_a = 8'h00;
    		10 :  data_a = 8'h10;
    		11 :  data_a = 8'h15;
    		12 :  data_a = 8'h60;
    		13 :  data_a = 8'h90;
    		14 :  data_a = 8'h70;
    		15 :  data_a = 8'h90;
			default:  data_a = 8'hxx;
		endcase
	end
end

endmodule
