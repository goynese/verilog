 module counter(
    input restart,              
    input reset_n,   
    input clk,          	// fast input clock     
    output reg [31:0]count
  );




always @(posedge clk, negedge reset_n) begin
reg	[31:0]current_count;

	if(!reset_n) begin
		count <= current_count;		
		current_count[31:0] <= 1'b0;
	end else if(restart) begin
		count <= current_count;		
		current_count[31:0] <= 1'b0;
	end else begin
		current_count[31:0] <= current_count[31:0] + 1'd1;
	end

end

endmodule
