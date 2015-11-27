library verilog;
use verilog.vl_types.all;
entity Timer is
    generic(
        TCNT            : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        TLIM            : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0);
        TCTL            : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        READY           : integer := 0;
        OVERRUN         : integer := 2;
        CLK_RATE        : integer := 5
    );
    port(
        dbus_out        : out    vl_logic_vector(31 downto 0);
        dbus_in         : in     vl_logic_vector(31 downto 0);
        abus            : in     vl_logic_vector(31 downto 0);
        wren            : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of TCNT : constant is 1;
    attribute mti_svvh_generic_type of TLIM : constant is 1;
    attribute mti_svvh_generic_type of TCTL : constant is 1;
    attribute mti_svvh_generic_type of READY : constant is 1;
    attribute mti_svvh_generic_type of OVERRUN : constant is 1;
    attribute mti_svvh_generic_type of CLK_RATE : constant is 1;
end Timer;
