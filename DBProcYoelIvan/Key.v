module keyModule(clk, dbus, abus, wren, value, dbusout);
    parameter KDATA = 32'hF0000010;
    parameter KCTRL = 32'hF0000110;
//	 parameter READY = 0;
	// parameter OVERRUN = 2;
	// parameter ie = 8;
	
	 input clk;
    input [31:0]    dbus;
	 input [3:0] value;
    input [31:0]    abus;
    input           wren;
	 output [31:0] dbusout;
	 reg ready, overrun;
	 
	 reg [31 : 0] key_reg;
	 
	 always @(posedge clk)begin
//		if (value != key_reg)
//			ready <= 1'b1;
//		if ()
//			key_reg <= 32'b0;
//			if (value != key_reg) begin
//				if (ready)
//					overrun <= 1'b1;
//				key_reg <= value;
//				ready <= 1'b1;
//			end
//			if (abus == KDATA) begin
//				if (!wren) begin
//					key_reg <= (~value & 4'hf);
//					ready <= 1'b0;
//					overrun <= 1'b0;
//				end
//			end
//			else if (abus == KCTRL) begin
//				if (!wren && dbus[2] == 1'b0)
//					overrun <= 1'b0;
//			end
		if (abus == KDATA) begin
			if (!wren) begin
				key_reg <= (~value & 4'hf);
				ready <= 1'b0;
				overrun <= 1'b0;
			end
		end
		else if (abus == KCTRL) begin
			if (!wren && dbus[2] == 1'b0)
					overrun <= 1'b0;
		end
		else if (value != key_reg) begin
			if (ready)
					overrun <= 1'b1;
			key_reg <= (~value & 4'hf);
			ready <= 1'b1;
		end
	 end
	 
    assign dbusout = (wren == 0 && abus == KDATA) ? key_reg : (wren == 0 && abus == KCTRL) ? {29'b0, overrun, 1'b0, ready} : 32'b0;
endmodule
	 
	 


