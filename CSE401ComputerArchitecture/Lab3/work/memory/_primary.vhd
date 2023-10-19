library verilog;
use verilog.vl_types.all;
entity memory is
    port(
        data            : out    vl_logic_vector(31 downto 0);
        addr            : in     vl_logic_vector(31 downto 0)
    );
end memory;
