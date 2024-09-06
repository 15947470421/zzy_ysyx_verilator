module top (
    input clk,
    input rst,
    input [7:0] din,
    input din_en,

    output clk_led,
    output [7:0] seg0,
    output [7:0] seg1
);
    
    wire [7:0] LFSR_to_seg;
    wire clk_o;

    clock i_clock(
        .clk_in(clk),
        .rst(rst),
        .clk_out(clk_o)
    );

    assign clk_led = clk_o; // clock to led

    LFSR i0 (
        .clk(clk_o),
        .rst(rst),
        .din(din),
        .din_en(din_en),
        .dout(LFSR_to_seg)
    );

    bcd15seg i1(
        .b(LFSR_to_seg[3:0]),
        .h(seg0)
    );

    bcd15seg i2(
        .b(LFSR_to_seg[7:4]),
        .h(seg1)
    );

endmodule

