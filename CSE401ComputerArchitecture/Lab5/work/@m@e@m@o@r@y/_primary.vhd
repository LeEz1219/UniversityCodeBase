library verilog;
use verilog.vl_types.all;
entity MEMORY is
    port(
        wb_ctlout       : in     vl_logic_vector(1 downto 0);
        branch          : in     vl_logic;
        memread         : in     vl_logic;
        memwrite        : in     vl_logic;
        zero            : in     vl_logic;
        alu_result      : in     vl_logic_vector(31 downto 0);
        rdata2out       : in     vl_logic_vector(31 downto 0);
        five_bit_muxout : in     vl_logic_vector(4 downto 0);
        MEM_PCSrc       : out    vl_logic;
        MEM_WB_regwrite : out    vl_logic;
        MEM_WB_memtoreg : out    vl_logic;
        read_data       : out    vl_logic_vector(31 downto 0);
        mem_alu_result  : out    vl_logic_vector(31 downto 0);
        mem_write_reg   : out    vl_logic_vector(4 downto 0)
    );
end MEMORY;
