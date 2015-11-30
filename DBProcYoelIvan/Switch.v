//module switchModule(clk, dbus, abus, wren, value, dbusout);
//    parameter SDATA = 32'hF0000014;
//    parameter SCTRL = 32'hF0000114;
////	 parameter READY = 0;
//	// parameter OVERRUN = 2;
//	// parameter ie = 8;
//	
//	 input clk;
//    input [31:0]    dbus;
//	 input [9:0] value;
//    input [31:0]    abus;
//    input           wren;
//	 output [31:0] dbusout;
//	 reg ready, overrun;
//
//	 reg [31 : 0] sw_reg;
//	 reg [31:0] counter;
//	 
//	  always @(posedge clk)begin
////		if (value != key_reg)
////			ready <= 1'b1;
////		if ()
//			counter <= 32'd0;
//			if (abus == SDATA) begin
//				if (!wren) begin
//					ready <= 1'b0;
//					overrun <= 1'b0;
//				end
//			end
//			else if (abus == SCTRL) begin
//				if (!wren && dbus[2] == 1'b0)
//					overrun <= 1'b0;
//			end
//			else if (value != sw_reg) begin
//				if (ready) begin
//					if (counter == 32'd10000) begin
//						sw_reg <= value;
//						overrun <= 1'b1;
//						counter <= 32'd0;
//					end
//					else begin
//						counter <= counter + 32'd1;
//					end
//				end
//				else begin
//					if (counter == 32'd10000) begin
//						sw_reg <= value;
//						counter <= 32'd0;
//						ready <= 1'b1;
//					end
//					else begin
//						counter <= counter + 32'd1;
//					end
//				end
//			end
//	 end
//	 
//    assign dbusout = (wren == 0 && abus == SDATA) ? sw_reg : (wren == 0 && abus == SCTRL) ? {29'b0, overrun, 1'b0, ready} : 32'b0;
//	 
//endmodule	 
module switchModule(clk, dbus, abus, wren, value, dbusout);
    parameter SDATA = 32'hF0000014;
    parameter SCTRL = 32'hF0000114;
//	 parameter READY = 0;
	// parameter OVERRUN = 2;
	// parameter ie = 8;
	
	 input clk;
    input [31:0]    dbus;
	 input [9:0] value;
    input [31:0]    abus;
    input           wren;
	 output [31:0] dbusout;

	 reg [31 : 0] sw_reg;
	 reg overrun, ready;
	 
	 always @(posedge clk)begin
		if (abus == SDATA) begin
			if (!wren) begin
				sw_reg <= value;
				ready <= 1'b0;
				overrun <= 1'b0;
			end
		end
		else if (abus == SCTRL) begin
			if (!wren && dbus[2] == 1'b0)
					overrun <= 1'b0;
		end
		else if (value != sw_reg) begin
			if (ready)
					overrun <= 1'b1;
			sw_reg <= value;
			ready <= 1'b1;
		end
	 end
	 
    assign dbusout = (wren == 0 && abus == SDATA) ? sw_reg : 32'b0;
	 
endmodule	 





