library verilog;
use verilog.vl_types.all;
entity s_extend is
    port(
        nextend         : in     vl_logic_vector(15 downto 0);
        extend          : out    vl_logic_vector(31 downto 0)
    );
end s_extend;
