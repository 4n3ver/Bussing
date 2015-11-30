module DataMemory(clk, wren, addr, dIn, sw, key, ledr, ledg, hex, dbus_out);
	parameter MEM_INIT_FILE;
	parameter ADDR_BIT_WIDTH = 32;
	parameter DATA_BIT_WIDTH = 32;
	parameter TRUE_ADDR_BIT_WIDTH = 11;
	parameter N_WORDS = (1 << TRUE_ADDR_BIT_WIDTH);

    parameter HEX   = 32'hF0000000;
    parameter LEDR  = 32'hF0000004;
    parameter LEDG  = 32'hF0000008;
    parameter KEY   = 32'hF0000010;
    parameter SW    = 32'hF0000014;
    parameter VALID = 32'h00000800;

    wire wrtEn;
    wire [31:0] dOut;

	input clk, wren;
	input [3:0] key;
	input [9:0] sw;
	input [31:0] addr;
	input [DATA_BIT_WIDTH - 1 : 0] dIn;
	output [DATA_BIT_WIDTH - 1 : 0] dbus_out;
	output reg [9:0] ledr;
	output reg [7:0] ledg;
	output reg [15:0] hex;

	(* ram_init_file = MEM_INIT_FILE *)
	reg [DATA_BIT_WIDTH - 1 : 0] data [0 : N_WORDS - 1];
	reg [TRUE_ADDR_BIT_WIDTH - 1 :0] addr_reg;
	reg [DATA_BIT_WIDTH - 1 : 0] sw_reg;
	reg [DATA_BIT_WIDTH - 1 : 0] key_reg;

	always @(posedge clk) begin
		if (addr[29]) begin
			if (wrtEn) begin
	  			if (addr[2]) ledr <= dIn[9:0];
				else if (addr[3]) ledg <= dIn[7:0];
				else hex <= dIn[15:0];
	      end else begin
	     		if (addr[2]) sw_reg <= sw;
	     		else key_reg <= (~key & 4'hf);
	     	end
     	end
    end

	always @(negedge clk) begin
		if (wrtEn && !addr[29]) data[addr[13:2]] <= dIn;
		addr_reg <= addr[13:2];
	end

	assign dOut = addr[29] ? (addr[2] ? sw_reg : key_reg) : data[addr_reg];

	assign wrtEn = (wren == 1'b1) && (addr < VALID || addr == HEX || addr == LEDR || addr == LEDG) ? 1'b1 : 1'b0;
    assign dbus_out = (wren == 1'b0) && (addr < VALID || addr == KEY || addr == SW) ? dOut : 32'b0;
endmodule







