
module top(
	input 		clk,
	input 		clk_mem,
	input 		reset_n,
	input 		sensor,
	output 		LED
);

wire [7:0] 	ROM_data;
wire [3:0] 	ROM_addr;
wire 		ROM_re;
wire 		ROM_ce;

sensor sensor_0(
	.clk 		(clk), 		// Main system clock
	.reset_n 	(reset_n), 	// Global asynchronous reset
	.sensor 	(sensor), 	// Input from sensor
	.LED 		(LED), 		// Output to LEDs
	//ROM interface
	.clk_mem 	(clk_mem), 	// Slower clock for memory
	.ROM_data 	(ROM_data), // Data from ROM
	.ROM_addr 	(ROM_addr), // ROM address pointer
	.ROM_re		(ROM_re), 	// Rom read enable
	.ROM_ce		(ROM_ce) 	// ROM chip enable
);

rom rom_0(
	.address 	(ROM_addr), // Address Input
	.data    	(ROM_data), // Data Output
	.re 		(ROM_re), 	// Read Enable 
	.ce 		(ROM_ce), 	// Chip Enable
	.clk 		(clk_mem) 	// Memory Clock
);


endmodule
