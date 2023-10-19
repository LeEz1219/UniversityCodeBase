library verilog;
use verilog.vl_types.all;
entity I_FETCH is
    port(
        IF_ID_instr     : out    vl_logic_vector(31 downto 0);
        IF_ID_npc       : out    vl_logic_vector(31 downto 0);
        EX_MEM_PCSrc    : in     vl_logic;
        EX_MEM_NPC      : in     vl_logic_vector(31 downto 0)
    );
end I_FETCH;
