library verilog;
use verilog.vl_types.all;
entity ex_mem is
    port(
        ctlwb_out       : in     vl_logic_vector(1 downto 0);
        ctlm_out        : in     vl_logic_vector(2 downto 0);
        adder_out       : in     vl_logic_vector(31 downto 0);
        aluzero         : in     vl_logic;
        readdat2        : in     vl_logic_vector(31 downto 0);
        aluout          : in     vl_logic_vector(31 downto 0);
        muxout          : in     vl_logic_vector(4 downto 0);
        wb_ctlout       : out    vl_logic_vector(1 downto 0);
        branch          : out    vl_logic;
        memread         : out    vl_logic;
        memwrite        : out    vl_logic;
        add_result      : out    vl_logic_vector(31 downto 0);
        zero            : out    vl_logic;
        alu_result      : out    vl_logic_vector(31 downto 0);
        rdata2out       : out    vl_logic_vector(31 downto 0);
        five_bit_muxout : out    vl_logic_vector(4 downto 0)
    );
end ex_mem;
