library verilog;
use verilog.vl_types.all;
entity mux is
    generic(
        BITS            : integer := 32
    );
    port(
        y               : out    vl_logic_vector;
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        sel             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BITS : constant is 1;
end mux;
