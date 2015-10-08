library verilog;
use verilog.vl_types.all;
entity mem_to_fifo_sm is
    port(
        ROM_data        : in     vl_logic_vector(7 downto 0);
        restart         : in     vl_logic;
        reset_n         : in     vl_logic;
        clk_mem         : in     vl_logic;
        fifo_wr         : out    vl_logic;
        ROM_re          : out    vl_logic;
        ROM_ce          : out    vl_logic;
        ROM_addr        : out    vl_logic_vector(3 downto 0);
        data_mem_to_fifo: out    vl_logic_vector(7 downto 0)
    );
end mem_to_fifo_sm;
