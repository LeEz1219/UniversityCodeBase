library verilog;
use verilog.vl_types.all;
entity EXECUTE is
    port(
        wb_ctl          : in     vl_logic_vector(1 downto 0);
        m_ctl           : in     vl_logic_vector(2 downto 0);
        regdst          : in     vl_logic;
        alusrc          : in     vl_logic;
        aluop           : in     vl_logic_vector(1 downto 0);
        npcout          : in     vl_logic_vector(31 downto 0);
        rdata1          : in     vl_logic_vector(31 downto 0);
        rdata2          : in     vl_logic_vector(31 downto 0);
        s_extendout     : in     vl_logic_vector(31 downto 0);
        instrout_2016   : in     vl_logic_vector(4 downto 0);
        instrout_1511   : in     vl_logic_vector(4 downto 0);
        wb_ctlout       : out    vl_logic_vector(1 downto 0);
        branch          : out    vl_logic;
        memread         : out    vl_logic;
        memwrite        : out    vl_logic;
        EX_MEM_NPC      : out    vl_logic_vector(31 downto 0);
        zero            : out    vl_logic;
        alu_result      : out    vl_logic_vector(31 downto 0);
        rdata2out       : out    vl_logic_vector(31 downto 0);
        five_bit_muxout : out    vl_logic_vector(4 downto 0)
    );
end EXECUTE;
