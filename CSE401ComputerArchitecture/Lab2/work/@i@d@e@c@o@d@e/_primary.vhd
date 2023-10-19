library verilog;
use verilog.vl_types.all;
entity IDECODE is
    port(
        IF_ID_instrout  : in     vl_logic_vector(31 downto 0);
        IF_ID_npcout    : in     vl_logic_vector(31 downto 0);
        MEM_WB_rd       : in     vl_logic_vector(4 downto 0);
        MEM_WB_regwrite : in     vl_logic;
        WB_mux5_writedata: in     vl_logic_vector(31 downto 0);
        wb_ctlout       : out    vl_logic_vector(1 downto 0);
        m_ctlout        : out    vl_logic_vector(2 downto 0);
        regdst          : out    vl_logic;
        alusrc          : out    vl_logic;
        aluop           : out    vl_logic_vector(1 downto 0);
        npcout          : out    vl_logic_vector(31 downto 0);
        rdata1out       : out    vl_logic_vector(31 downto 0);
        rdata2out       : out    vl_logic_vector(31 downto 0);
        s_extendout     : out    vl_logic_vector(31 downto 0);
        instrout_2016   : out    vl_logic_vector(4 downto 0);
        instrout_1511   : out    vl_logic_vector(4 downto 0)
    );
end IDECODE;
