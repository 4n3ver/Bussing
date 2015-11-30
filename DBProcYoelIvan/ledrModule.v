module ledrModule(clk, dbus, abus, wren, value, dbusout);
	 parameter KDATA = 32'hF0000004;
	 input clk;
    input [31:0]    dbus;
    input [31:0]    abus;
    input           wren;
	 output [9:0] value;
	 output reg [31:0] dbusout;
	 
	 reg [31: 0] ledrReg;
	 
	 always @(posedge clk) begin
		if (wren) begin
			if (abus == KDATA)
				ledrReg <= (dbus & 32'h000003FF);
			dbusout <= 32'b0;
		end
		else begin
			if (abus == KDATA)
				dbusout <= ledrReg;
			else
				dbusout <= 32'b0;
		end		
	 end
	 
	 assign value = ledrReg[9:0];
endmodule