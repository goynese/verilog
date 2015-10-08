library verilog;
use verilog.vl_types.all;
entity counter_sm is
    port(
        \in\            : in     vl_logic;
        reset_n         : in     vl_logic;
        clk             : in     vl_logic;
        restart         : out    vl_logic;
        restart_mem     : out    vl_logic
    );
end counter_sm;
