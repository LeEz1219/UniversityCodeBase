library verilog;
use verilog.vl_types.all;
entity id_ex is
    port(
        ctlwb_out       : in     vl_logic_vector(1 downto 0);
        ctlm_out        : in     vl_logic_vector(2 downto 0);
        ctlex_out       : in     vl_logic_vector(3 downto 0);
        npc             : in     vl_logic_vector(31 downto 0);
        readdat1        : in     vl_logic_vector(31 downto 0);
        readdat2        : in     vl_logic_vector(31 downto 0);
        signext_out     : in     vl_logic_vector(31 downto 0);
        instr_2016      : in     vl_logic_vector(4 downto 0);
        instr_1511      : in     vl_logic_vector(4 downto 0);
        wb_ctlout       : out    vl_logic_vector(1 downto 0);
        m_ctlout        : out    vl_logic_vector(2 downto 0);
        alusrc          : out    vl_logic;
        regdst          : out    vl_logic;
        aluop           : out    vl_logic_vector(1 downto 0);
        s_extendout     : out    vl_logic_vector(31 downto 0);
        rdata2out       : out    vl_logic_vector(31 downto 0);
        rdata1out       : out    vl_logic_vector(31 downto 0);
        npcout          : out    vl_logic_vector(31 downto 0);
        instrout_1511   : out    vl_logic_vector(4 downto 0);
        instrout_2016   : out    vl_logic_vector(4 downto 0)
    );
end id_ex;
