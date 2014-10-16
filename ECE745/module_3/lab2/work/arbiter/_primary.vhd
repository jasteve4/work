library verilog;
use verilog.vl_types.all;
entity arbiter is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        grant           : out    vl_logic_vector(1 downto 0);
        request         : in     vl_logic_vector(1 downto 0)
    );
end arbiter;
