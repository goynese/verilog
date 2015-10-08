module logic_blk (
  input        clk,        //clock input   
  input        reset_n,    //async reset  
  input        wr,         //clock input   
  input        rd,         //clock input   
  output       wr_ram,     //count up 
  output       rd_ram,     //count down 
  output       error_flag  //count down 
  );
  endmodule
