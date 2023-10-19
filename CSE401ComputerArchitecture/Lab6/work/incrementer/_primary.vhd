library verilog;
use verilog.vl_types.all;
entity incrementer is
    port(
        pcin            : in     vl_logic_vector(31 downto 0);
        pcout           : out    vl_logic_vector(31 downto 0)
    );
end incrementer;
