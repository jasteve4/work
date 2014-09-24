library verilog;
use verilog.vl_types.all;
entity xor_design is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        studentid       : in     vl_logic_vector(71 downto 0);
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        y               : out    vl_logic_vector(3 downto 0)
    );
end xor_design;
