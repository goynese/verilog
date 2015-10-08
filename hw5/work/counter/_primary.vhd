library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        restart         : in     vl_logic;
        reset_n         : in     vl_logic;
        clk             : in     vl_logic;
        count           : out    vl_logic_vector(31 downto 0)
    );
end counter;
