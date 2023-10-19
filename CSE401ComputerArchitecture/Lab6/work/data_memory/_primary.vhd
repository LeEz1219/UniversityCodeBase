library verilog;
use verilog.vl_types.all;
entity data_memory is
    port(
        addr            : in     vl_logic_vector(31 downto 0);
        write_data      : in     vl_logic_vector(31 downto 0);
        memwrite        : in     vl_logic;
        memread         : in     vl_logic;
        read_data       : out    vl_logic_vector(31 downto 0)
    );
end data_memory;
