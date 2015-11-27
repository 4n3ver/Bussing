module Key(dbus, abus, wren);
    parameter KDATA = 32'hF0000010;
    parameter KCTRL = 32'hF0000110;

    inout [31:0]    dbus;

    input [31:0]    abus;
    input           wren;

    reg[31:0]   state;

    assign dbus = wren == 0 && abus == ME ? state : 32'b0;


