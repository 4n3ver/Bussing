module DataMem(clk, wren, dIn, addr, dbus_out);
	parameter MEM_INIT_FILE;
	parameter ADDR_BIT_WIDTH = 32;
	parameter DATA_BIT_WIDTH = 32;
	parameter TRUE_ADDR_BIT_WIDTH = 11;
	parameter N_WORDS = (1 << TRUE_ADDR_BIT_WIDTH);
   parameter VALID = 32'h00000800;
	
	input clk, wren;
	input [31:0] addr;
	input [DATA_BIT_WIDTH - 1 : 0] dIn;
	output [DATA_BIT_WIDTH - 1 : 0] dbus_out;
	
	reg [DATA_BIT_WIDTH - 1 : 0] data [0 : N_WORDS - 1];
	reg[31:0] dataReg;
	
	always @(negedge clk) begin
		if (!addr[29]) begin
			if (wren)
				data[addr[13:2]] <= dIn;
			dataReg <= data[addr[13:2]];
		end
	end
	
	assign dbus_out = (addr < VALID && !wren) ? dataReg : 32'b0;
endmodule