library verilog;
use verilog.vl_types.all;
entity fifo is
    port(
        data_in         : in     vl_logic_vector(7 downto 0);
        wr              : in     vl_logic;
        rd              : in     vl_logic;
        restart         : in     vl_logic;
        reset_n         : in     vl_logic;
        clk_mem         : in     vl_logic;
        clk             : in     vl_logic;
        data_out        : out    vl_logic_vector(7 downto 0);
        fifo_empty      : out    vl_logic
    );
end fifo;
