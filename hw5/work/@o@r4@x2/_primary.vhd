library verilog;
use verilog.vl_types.all;
entity OR4X2 is
    port(
        IN1             : in     vl_logic;
        IN2             : in     vl_logic;
        IN3             : in     vl_logic;
        IN4             : in     vl_logic;
        Q               : out    vl_logic
    );
end OR4X2;
