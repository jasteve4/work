library verilog;
use verilog.vl_types.all;
entity test_arbiter is
    port(
        clk             : in     vl_logic;
        reset           : out    vl_logic;
        grant           : in     vl_logic_vector(1 downto 0);
        request         : out    vl_logic_vector(1 downto 0)
    );
end test_arbiter;
