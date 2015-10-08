`timescale 1ps/1ps

module tb ();
  parameter CYCLE = 10000;  //10ns period = 100Mhz
  integer out_file;

//define needed internal wires (type reg) to apply signals to 	
	reg clk;
	reg [7:0] N;
	reg reset_n;	
	reg enable;
	reg out;
	
//create the clock
  initial begin
    clk = 0;
    forever #(CYCLE/2) clk = ~clk;
  end
 
//create reset_n
  initial begin
    reset_n = 0;       //initalize reset aserted
    @(posedge clk);    //wait 2 clock cycles
    @(posedge clk);   
    #100 reset_n = 1;   //release reset_n after 100ps past rising edge
  end

//initalize other signals at reset time
  initial begin  
  enable = 1'b0;
  N = 1'b0;
	
  end 
  
  initial begin
    @(posedge reset_n);
    enable<=1;
		N <= 'b0;

		#40000 N <= 'b10;

		#70000 N <= 'b100;
		
		#130000 enable <= 'b0;

		#90000 enable <= 'b1;

		#10 N <= 'b110;

		#190000 reset_n <= 'b0;

		#40000 reset_n <= 'b1;

  end
 
  //open file for results
  initial begin
    out_file = $fopen("divider.out"); 
    $fdisplay (out_file, "clk    enable    N    out    time");
  end
  //write results to file
  always @ (negedge clk)  begin
    $fdisplay (out_file,"%1b    %1b    %8h    %1b   %5d", clk, enable, N, out, $time);
  end

divider_even #(.WIDTH(8)) divider_0(
    .clk		(clk		),            // fast input clock
    .N			(N[7:0] ),            // divide by factor 'N'
    .reset_n		(reset_n),            // asynchronous reset
    .enable		(enable	),            // enable the even divider
    .out		(out		)            // slower divided clock
  );

endmodule 
