 module mem_to_fifo_sm(
    input [7:0]ROM_data,              
    input restart,  
    input reset_n,
    input clk_mem,          	
    output reg fifo_wr,           
    output reg ROM_re,            
    output reg ROM_ce,        
    output reg [3:0]ROM_addr,
	output reg [7:0]data_mem_to_fifo           
  );
assign ROM_ce = 1'b1;
assign ROM_re = 1'b1;

assign data_mem_to_fifo = ROM_data;

enum reg [3:0] {
init = 4'd1,
startfifo = 4'd2,
romadder1 = 4'd3,
romadder2 = 4'd4,
romadder3 = 4'd5,
almost_done = 4'd6,
done = 4'd7
} state;


always @(posedge clk_mem, negedge reset_n)begin
	if(~reset_n)begin
		state <= init;
		fifo_wr <= 1'd0;

	end
	else if(restart)begin
		state <= init;
		fifo_wr <= 1'd0;

	end
	else
	
	case (state)
	init : begin
		state <= startfifo;
		fifo_wr <= 1'd0;
		ROM_addr <= 4'd0;
	end
	startfifo : begin
				fifo_wr <= 1'd1;
				state <= romadder1;
	end
	romadder1 : begin
				ROM_addr <= 4'd1;
				state <= romadder2;
	end
	romadder2 : begin
				ROM_addr <= 4'd2;
				state <= romadder3;
	end
	romadder3 : begin
				ROM_addr <= 4'd3;
				state <= almost_done;
	end
	almost_done : begin
				state <= done;
	end
	done : begin
		fifo_wr <= 1'd0;
	end
	default: $display("Not Working");
endcase

end
endmodule
