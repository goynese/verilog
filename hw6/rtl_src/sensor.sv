 module sensor(
    input clk,              
    input reset_n,   
    input sensor,
	input [7:0]ROM_data,        
	input clk_mem,
	output [3:0]ROM_addr,
	output ROM_re,
	output ROM_ce,
    output LED                  
  );
wire restart_mem;
wire restart;
wire [31:0]N;
wire [31:0]count;

assign N = (count >> 5);

wire enable;
assign enable = 1'd1;

wire next_pixel;
wire fifo_wr;
wire [7:0]data_mem_to_fifo;
wire [7:0]data_out_to_data_in;
wire [31:0]data_out_shift_reg;
wire fifo_empty;

wire shift_sr;
wire load_sr;
wire fifo_rd;


counter_sm counter_sm0(
	.in		(sensor),
	.reset_n	(reset_n),
	.clk		(clk),
	.restart	(restart),
	.restart_mem	(restart_mem)
);

counter counter0(
	.restart	(restart),
	.reset_n	(reset_n),
	.clk		(clk),
	.count		(count)
);

divider_even divider_even0(
	.N			(N),
	.reset_n	(reset_n),
	.enable		(enable),
	.clk		(clk),
	.out		(next_pixel)
);

mem_to_fifo_sm mem_to_fifo_sm0(
	.ROM_data	(ROM_data),
	.restart	(restart_mem),
	.reset_n	(reset_n),
	.clk_mem	(clk_mem),
	.fifo_wr	(fifo_wr),
	.ROM_re		(ROM_re),
	.ROM_ce		(ROM_ce),
	.ROM_addr	(ROM_addr),
	.data_mem_to_fifo	(data_mem_to_fifo)
);

fifo fifo0(
	.data_in	(data_mem_to_fifo),
	.wr			(fifo_wr),
	.rd			(fifo_rd),
	.restart	(restart_mem),
	.reset_n	(reset_n),
	.clk_mem	(clk_mem),
	.clk		(clk),
	.data_out	(data_out_to_data_in),
	.fifo_empty	(fifo_empty)
);

shift_register_sm shift_register_sm0(
	.data_in	(data_out_to_data_in),
	.restart	(restart),
	.next_pixel	(next_pixel),
	.empty		(fifo_empty),
	.reset_n	(reset_n),
	.clk		(clk),
	.data_out	(data_out_shift_reg),
	.shift_sr	(shift_sr),
	.load_sr	(load_sr),
	.fifo_rd	(fifo_rd)
);

shift_register shift_register0(
	.in			(data_out_shift_reg),
	.shift		(shift_sr),
	.load		(load_sr),
	.reset_n	(reset_n),
	.clk		(clk),
	.out		(LED)
);

endmodule
