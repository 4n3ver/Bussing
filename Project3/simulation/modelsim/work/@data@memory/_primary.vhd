library verilog;
use verilog.vl_types.all;
entity DataMemory is
    generic(
        MEM_INIT_FILE   : vl_notype;
        ADDR_BIT_WIDTH  : integer := 32;
        DATA_BIT_WIDTH  : integer := 32;
        TRUE_ADDR_BIT_WIDTH: integer := 11;
        N_WORDS         : vl_notype;
        \HEX\           : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        \LEDR\          : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        \LEDG\          : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        \KEY\           : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        \SW\            : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi1, Hi0, Hi0);
        VALID           : integer := 2048
    );
    port(
        clk             : in     vl_logic;
        wren            : in     vl_logic;
        addr            : in     vl_logic_vector(31 downto 0);
        dIn             : in     vl_logic_vector;
        sw              : in     vl_logic_vector(9 downto 0);
        key             : in     vl_logic_vector(3 downto 0);
        ledr            : out    vl_logic_vector(9 downto 0);
        ledg            : out    vl_logic_vector(7 downto 0);
        hex             : out    vl_logic_vector(15 downto 0);
        dbus_out        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of MEM_INIT_FILE : constant is 5;
    attribute mti_svvh_generic_type of ADDR_BIT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DATA_BIT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of TRUE_ADDR_BIT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of N_WORDS : constant is 3;
    attribute mti_svvh_generic_type of \HEX\ : constant is 1;
    attribute mti_svvh_generic_type of \LEDR\ : constant is 1;
    attribute mti_svvh_generic_type of \LEDG\ : constant is 1;
    attribute mti_svvh_generic_type of \KEY\ : constant is 1;
    attribute mti_svvh_generic_type of \SW\ : constant is 1;
    attribute mti_svvh_generic_type of VALID : constant is 1;
end DataMemory;
