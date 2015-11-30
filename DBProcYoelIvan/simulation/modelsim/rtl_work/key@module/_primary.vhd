library verilog;
use verilog.vl_types.all;
entity keyModule is
    generic(
        KDATA           : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        KCTRL           : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        dbus            : in     vl_logic_vector(31 downto 0);
        abus            : in     vl_logic_vector(31 downto 0);
        wren            : in     vl_logic;
        value           : in     vl_logic_vector(3 downto 0);
        dbusout         : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of KDATA : constant is 1;
    attribute mti_svvh_generic_type of KCTRL : constant is 1;
end keyModule;
