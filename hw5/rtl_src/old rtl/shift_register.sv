 module shift_register(
    input [31:0]in,              
    input shift,   
    input load,              
    input reset_n,
    input clk,          	
    output reg out         
  );
reg [31:0]shift_register;
reg shiftnextbit;

always_ff @(posedge clk, negedge reset_n)
	
	if(~reset_n) begin
		shift_register <= 1'b0;
		out <= 1'b0;
		shiftnextbit <= 1'b0;
	end else if(load) begin
		shift_register <= in;
	end else
		out <= shift_register[0];
		shift_register <= shift_register>>1;
	end

endmodule
