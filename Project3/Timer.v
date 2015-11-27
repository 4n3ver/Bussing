module Timer(dbus_out, dbus_in, abus, wren, clk, rst);
    parameter TCNT      = 32'hF0000020;
    parameter TLIM      = 32'hF0000024;
    parameter TCTL      = 32'hF0000120;
    parameter READY     = 0;
    parameter OVERRUN   = 2;
    parameter CLK_RATE  = 32'd5;//32'd10000;

    input [31:0]    dbus_in;
    output /*reg*/ [31:0]   dbus_out;

    input [31:0]    abus;
    input           wren, clk, rst;

    reg [31:0]      tcnt,
                    tlim,
                    tctl;

    reg [31:0]      count1000Hz;

    always @(posedge clk) begin
        case (abus)
            TCNT: begin
                if (wren == 1'b1) begin
                    tcnt <= dbus_in;
                end else begin
                    // dbus_out <= tcnt;
                end
            end
            TLIM: begin
                if (wren == 1'b1) begin
                    tlim <= dbus_in;
                end else begin
                    //dbus_out <= tlim;
                end
            end
            TCTL: begin
                if (wren == 1'b1) begin
                    if (dbus_in == 32'b0)
                        tctl <= 32'b0;
                end else begin
                    //dbus_out <= tctl;
                end
            end
            // default: begin
            //     dbus_out <= 32'b0;
            // end
        endcase // abus

        count1000Hz <= count1000Hz + 32'b1;
        if (count1000Hz + 1'b1 == CLK_RATE) begin
            count1000Hz <= 32'b0;
            if (tlim > 32'b0 && tcnt >= (tlim - 1'b1)) begin
                tcnt <= 32'b0;
                if (tctl[READY])
                    tctl[OVERRUN] <= 1'b1;
                else
                    tctl[READY] <= 1'b1;
            end else begin
                tcnt <= tcnt + 32'b1;
            end
        end

        if (rst) begin
            tcnt        <= 32'b0;
            tlim        <= 32'b0;
            tctl        <= 32'b0;
            //dbus_out     <= 32'b0;
            count1000Hz  <= 32'b0;
        end
    end

    assign dbus_out = wren == 1'b0 && rst == 1'b0 ? (abus == TCNT ? tcnt : abus == TCTL ? tctl : abus == TLIM ? tlim : 32'b0) : 32'b0;
endmodule // Timer