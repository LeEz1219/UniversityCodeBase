library verilog;
use verilog.vl_types.all;
entity alu is
    generic(
        ALUadd          : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        ALUsub          : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        ALUand          : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        ALUor           : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        ALUslt          : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1)
    );
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        control         : in     vl_logic_vector(2 downto 0);
        result          : out    vl_logic_vector(31 downto 0);
        zero            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ALUadd : constant is 1;
    attribute mti_svvh_generic_type of ALUsub : constant is 1;
    attribute mti_svvh_generic_type of ALUand : constant is 1;
    attribute mti_svvh_generic_type of ALUor : constant is 1;
    attribute mti_svvh_generic_type of ALUslt : constant is 1;
end alu;
