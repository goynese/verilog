library verilog;
use verilog.vl_types.all;
entity fadder_4 is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        cin             : in     vl_logic;
        sum_out         : out    vl_logic;
        c_out           : out    vl_logic
    );
end fadder_4;
