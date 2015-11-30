module ledgModule(clk, dbus, abus, wren, value, dbusout);
	 parameter KDATA = 32'hF0000008;
	 input clk;
    input [31:0]    dbus;
    input [31:0]    abus;
    input           wren;
	 output [7:0] value;
	 output reg [31:0] dbusout;
	 
	 reg [31: 0] ledgReg;
	 
	 always @(posedge clk) begin
		if (wren) begin
			if (abus == KDATA)
				ledgReg <= (dbus & 32'h000000FF);
			dbusout <= 32'b0;
		end
		else begin
			if (abus == KDATA)
				dbusout <= ledgReg;
			else
				dbusout <= 32'b0;
		end		
	 end

	 assign value = ledgReg[7:0];
endmodule