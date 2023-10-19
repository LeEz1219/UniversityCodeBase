library verilog;
use verilog.vl_types.all;
entity if_id is
    port(
        instrout        : out    vl_logic_vector(31 downto 0);
        npcout          : out    vl_logic_vector(31 downto 0);
        instr           : in     vl_logic_vector(31 downto 0);
        npc             : in     vl_logic_vector(31 downto 0)
    );
end if_id;
