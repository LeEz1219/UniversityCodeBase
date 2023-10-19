library verilog;
use verilog.vl_types.all;
entity pc_mod is
    port(
        PC              : out    vl_logic_vector(31 downto 0);
        npc             : in     vl_logic_vector(31 downto 0)
    );
end pc_mod;
