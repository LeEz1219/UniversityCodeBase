library verilog;
use verilog.vl_types.all;
entity \AND\ is
    port(
        membranch       : in     vl_logic;
        zero            : in     vl_logic;
        PCSrc           : out    vl_logic
    );
end \AND\;
