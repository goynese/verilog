library verilog;
use verilog.vl_types.all;
entity CGLNPSX2 is
    port(
        SE              : in     vl_logic;
        EN              : in     vl_logic;
        CLK             : in     vl_logic;
        GCLK            : out    vl_logic
    );
end CGLNPSX2;
