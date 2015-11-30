module hexModule(clk, dbus, abus, wren, value, dbusout);
	 parameter KDATA = 32'hF0000000;
	 input clk;
    input [31:0]    dbus;
    input [31:0]    abus;
    input           wren;
	 output [15:0] value;
	 output reg [31:0] dbusout;
	 
	 reg [31: 0] hexReg;
	 
	 always @(posedge clk) begin
		if (wren) begin
			if (abus == KDATA)
				hexReg <= (dbus & 32'h0000FFFF);
			dbusout <= 32'b0;
		end
		else begin
			if (abus == KDATA)
				dbusout <= hexReg;
			else
				dbusout <= 32'b0;
		end		
	 end
	 
	 assign value = hexReg[15:0];
endmodule