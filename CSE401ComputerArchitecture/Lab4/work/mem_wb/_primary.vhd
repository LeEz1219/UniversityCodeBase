library verilog;
use verilog.vl_types.all;
entity mem_wb is
    port(
        control_wb_in   : in     vl_logic_vector(1 downto 0);
        read_data_in    : in     vl_logic_vector(31 downto 0);
        alu_result_in   : in     vl_logic_vector(31 downto 0);
        write_reg_in    : in     vl_logic_vector(4 downto 0);
        regwrite        : out    vl_logic;
        memtoreg        : out    vl_logic;
        read_data       : out    vl_logic_vector(31 downto 0);
        mem_alu_result  : out    vl_logic_vector(31 downto 0);
        mem_write_reg   : out    vl_logic_vector(4 downto 0)
    );
end mem_wb;
