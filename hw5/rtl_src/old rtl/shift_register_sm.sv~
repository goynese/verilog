 module shift_register_sm(
    input [7:0]data_in,              
    input restart,   
    input next_pixel,              
    input empty,   
    input reset_n,
    input clk,          	// fast input clock
    output reg [31:0]data_out,           
    output reg shift_sr,            
    output reg load_sr,        
    output reg fifo_rd           
  );
reg [31:0]out;

enum reg [3:0] {
init = 4'd1,
load1 = 4'd2,
sync1 = 4'd3,
load2 = 4'd4,
sync2 = 4'd5,
load3 = 4'd6,
sync3 = 4'd7,
load4 = 4'd8,
sync4 = 4'd9,
firstnextpixellow = 4'd10,
load4last = 4'd11,
firstnextpixelhigh = 4'd12,
firstnextpixellow2 = 4'd13,
nextpixel = 4'd14,
notnextpixel = 4'd15
} state;


always_ff @(posedge clk, negedge reset_n) begin
	if(~reset_n)begin
	state <= init;
	fifo_rd <= 1'd0;
	end else if(restart)begin
	state <= init;
	fifo_rd <= 1'd0;
	end else begin
	
	case (state)
	init : begin
		state <= load1;
		fifo_rd <= 1'd0;
		end
	load1 :	begin
		if(~empty)begin
			fifo_rd <= 1'd1;
			state <= sync1;
		end
	end
	sync1 : begin
			state <= load2;
			fifo_rd <= 1'd0;
	end
	load2 : begin
			if(~empty)begin
				out[7:0] <= data_in;
				state <= sync2;
				fifo_rd <= 1'd1;
			end
	end
	sync2 :	begin
				state <= load3;
				fifo_rd <= 1'd0;
	end
	load3 : begin
		if(~empty)begin
			out[15:8] <= data_in;
			state <= sync3;
			fifo_rd <= 1'd1;
		end
	end
	sync3 : begin
				state <= load4;
				fifo_rd <= 1'd0;
	end
	load4 :	begin
			if(~empty)begin
				out[23:16] <= data_in;
				state <= sync4;
				fifo_rd <= 1'd1;
			end
	end
	sync4 :	begin
			state <= firstnextpixellow;
			fifo_rd <= 1'd1;
	end
	firstnextpixellow : begin
					 fifo_rd <= 1'd0;
					 if(~next_pixel)begin
						state <= load4last;
						out[31:24] <= data_in;
					end
	end
	load4last : begin
				data_out <= out;
				load_sr <= 1'd1;
				state <= firstnextpixelhigh;
	end
	firstnextpixelhigh : begin
			if(next_pixel)begin
				shift_sr <= 1'd1;
				state <= firstnextpixellow2;
				end
	end
	firstnextpixellow2 : begin
			load_sr <= 1'd0;
			if(~next_pixel)begin
			shift_sr <= 1'd0;
			state <= nextpixel;
			end
	end
	nextpixel : begin
		   if(next_pixel)begin
				shift_sr <= 1'd1;
				state <= notnextpixel;
		   end
	end
	notnextpixel : begin
				shift_sr <=1'd0;
				if(~next_pixel) begin
					state <= nextpixel;
				end
	end
	default : $display("Not Working");
endcase
end

end
endmodule
