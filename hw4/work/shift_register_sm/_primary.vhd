library verilog;
use verilog.vl_types.all;
entity shift_register_sm is
    port(
        data_in         : in     vl_logic_vector(7 downto 0);
        restart         : in     vl_logic;
        next_pixel      : in     vl_logic;
        empty           : in     vl_logic;
        reset_n         : in     vl_logic;
        clk             : in     vl_logic;
        data_out        : out    vl_logic_vector(31 downto 0);
        shift_sr        : out    vl_logic;
        load_sr         : out    vl_logic;
        fifo_rd         : out    vl_logic
    );
end shift_register_sm;
