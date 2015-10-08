library verilog;
use verilog.vl_types.all;
entity divider_even is
    generic(
        WIDTH           : integer := 32
    );
    port(
        clk             : in     vl_logic;
        N               : in     vl_logic_vector;
        reset_n         : in     vl_logic;
        enable          : in     vl_logic;
        \out\           : out    vl_logic
    );
end divider_even;
