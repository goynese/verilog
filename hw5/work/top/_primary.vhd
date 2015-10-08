library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        clk_mem         : in     vl_logic;
        reset_n         : in     vl_logic;
        sensor          : in     vl_logic;
        LED             : out    vl_logic
    );
end top;
