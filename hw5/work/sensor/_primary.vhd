library verilog;
use verilog.vl_types.all;
entity sensor is
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        sensor          : in     vl_logic;
        ROM_data        : in     vl_logic_vector(7 downto 0);
        clk_mem         : in     vl_logic;
        ROM_addr        : out    vl_logic_vector(3 downto 0);
        ROM_re          : out    vl_logic;
        ROM_ce          : out    vl_logic;
        LED             : out    vl_logic
    );
end sensor;
