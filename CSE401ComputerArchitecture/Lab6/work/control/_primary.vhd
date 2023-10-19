library verilog;
use verilog.vl_types.all;
entity control is
    generic(
        RTYPE           : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        LW              : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi1);
        SW              : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi1);
        BEQ             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        NOP             : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        EX              : out    vl_logic_vector(3 downto 0);
        M               : out    vl_logic_vector(2 downto 0);
        WB              : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of RTYPE : constant is 1;
    attribute mti_svvh_generic_type of LW : constant is 1;
    attribute mti_svvh_generic_type of SW : constant is 1;
    attribute mti_svvh_generic_type of BEQ : constant is 1;
    attribute mti_svvh_generic_type of NOP : constant is 1;
end control;
