library verilog;
use verilog.vl_types.all;
entity rom is
    port(
        address         : in     vl_logic_vector(3 downto 0);
        data            : out    vl_logic_vector(7 downto 0);
        re              : in     vl_logic;
        ce              : in     vl_logic;
        clk             : in     vl_logic
    );
end rom;
