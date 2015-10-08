 module fifo(
    input data_in,              
    input wr,   
    input rd              
    input restart,   
    input reset_n,
	input clk_mem,
    input clk,          	
    output reg data_out,                  
    output reg fifo_empty          
  );
  reg byte1[7:0];
  reg byte2[7:0];
  reg byte3[7:0];
  reg byte4[7:0];
  reg bytewr;
  reg byterd;

always @(posedge clk), negedge reset_n)begin
                              
	if(rd)
	byterd <= 0;
	end

	case (byterd)
		2'd0 : data_out <= byte1;

	if(wr)
	bytewr <= bytewr + 1;
end

always @(posedge clk_mem, negedge reset_n) begin

	if(restart)begin
	bytewr <= 0; 
	end

	case (bytewr)
		2'd0 : byte1 <= data_in;
		2'd1 : byte2 <= data_in;
		2'd2 : byte3 <= data_in;
		2'd3 : byte4 <= data_in;
		default :
	endcase

	if(wr)
	bytewr <= bytewr + 1;
end

endmodule
