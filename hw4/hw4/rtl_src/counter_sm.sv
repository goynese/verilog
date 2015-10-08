 module counter_sm(
    input in,         
    input reset_n,   
    input clk,          	// fast input clock
    output reg restart,
    output reg restart_mem
  );

enum reg [2:0]{ 
init = 3'd1,
infound = 3'd2,
reset_done = 3'd3,
wait1 = 3'd4,
wait2 = 3'd5,
done = 3'd6
} state = init;



always @(posedge clk, negedge reset_n)
	if(~reset_n) begin
		state <= init;
	end else

	case (state)
		init :	begin
				restart <= 1'd0;
				restart_mem <= 1'd0;				//INIT STATE 1
				if(in)
				state <= infound;
		end

		infound :begin
				restart <= 1'd1;
				restart_mem <= 1'd1;				//IN_FOUND STATE 2
				state <= reset_done;
		end
		reset_done :begin
				restart <= 1'd0;
				restart_mem <= 1'd1;							//RESET_DONE STATE 3
				state <= wait1;
		end

		wait1 : state <= wait2;									//Wait 1
		wait2 :	state <= done;									//Wait 2

		done : begin
				restart_mem <= 1'd0;
				if(~in)
					state <= init;
		end
					//ALL_DONE STATE 4
		default : $display("Not Working");
	endcase

endmodule
