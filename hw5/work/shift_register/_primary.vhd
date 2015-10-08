library verilog;
use verilog.vl_types.all;
entity shift_register is
    port(
        \in\            : in     vl_logic_vector(31 downto 0);
        shift           : in     vl_logic;
        load            : in     vl_logic;
        reset_n         : in     vl_logic;
        clk             : in     vl_logic;
        \out\           : out    vl_logic
    );
end shift_register;
