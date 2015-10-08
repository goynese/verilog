 module fifo(
    input [7:0]data_in,
    input wr,
    input rd,
    input restart,
    input reset_n,
	input clk_mem,
    input clk,
    output reg [7:0]data_out,
    output fifo_empty
  );
	reg [7:0]byte1;
	reg [7:0]byte2;
	reg [7:0]byte3;
	reg [7:0]byte4;
	reg [2:0]write_ptr;
	reg [2:0]read_ptr;

	reg prevempty;
	reg emptyraw;

assign emptyraw = (write_ptr == read_ptr);
assign fifo_empty = (prevempty | emptyraw);


always_ff @(posedge clk, negedge reset_n)begin
	if(!reset_n)begin
		write_ptr <= 1'b0;
		read_ptr <= 1'b0;
		prevempty <= 1'b1;
		byte1 <= 1'b0;
		byte2 <= 1'b0;
		byte3 <= 1'b0;
		byte4 <= 1'b0;
		data_out <= 1'b0;

	end else if(restart)begin

		write_ptr <= 1'b0;
		read_ptr <= 1'b0;
		prevempty <= 1'b1;
		byte1 <= 1'b0;
		byte2 <= 1'b0;
		byte3 <= 1'b0;
		byte4 <= 1'b0;
		data_out <= 1'b0;

	end else

	prevempty <= emptyraw;

	if(rd)begin
		case (read_ptr)
		3'd0 : begin
				data_out <= byte1;
				read_ptr <= 3'd1;
		end
		3'd1 : begin
				data_out <= byte2;
				read_ptr <= 3'd2;
		end
		3'd2 : begin
				data_out <= byte3;
				read_ptr <= 3'd3;
		end
		3'd3 : begin
				data_out <= byte4;
				read_ptr <= 3'd4;
		end
		default : $display("Not Working");
	endcase
	end 

end

always @(posedge clk_mem, negedge reset_n) begin

	if(wr)begin

		case (write_ptr)
			3'd0 : begin
					byte1 <= data_in;
					write_ptr <= 3'd1;
			end
			3'd1 : begin
					byte2 <= data_in;
					write_ptr <= 3'd2;
			end
			3'd2 : begin
					byte3 <= data_in;
					write_ptr <= 3'd3;
			end
			3'd3 : begin
					byte4 <= data_in;
					write_ptr <= 3'd4;
			end
			default : $display("Not Working");
		endcase

	end
end
endmodule
