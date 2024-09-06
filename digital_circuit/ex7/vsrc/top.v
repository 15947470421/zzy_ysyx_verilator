module top (
    input clk,
    input rst,
    input ps2_clk,
    input ps2_data,

    output [7:0] seg0,
    output [7:0] seg1,
    output [7:0] seg2,
    output [7:0] seg3,
    output [7:0] seg4,
    output [7:0] seg5
);

    wire [7:0] scan_code;
    wire [7:0] ascii;
    wire [7:0] count;

    ps2_keyboard i0 (
        .clk(clk),
        .rstn(~rst),
        .ps2_clk(ps2_clk),
        .ps2_data(ps2_data),
        .scan_code(scan_code)
    );

    bcd15seg i1(
        .b(scan_code[3:0]),
        .h(seg0)
    );

    bcd15seg i2(
        .b(scan_code[7:4]),
        .h(seg1)
    );

    scan_code_to_ascii i3 (
        .scan_code(scan_code),
        .ascii(ascii)
    );

    bcd15seg i4 (
        .b(ascii[3:0]),
        .h(seg2)
    );

    bcd15seg i5 (
        .b(ascii[7:4]),
        .h(seg3)
    );

    key_counter i6 (
        .clk(clk),
        .rst(rst),
        .scan_code(scan_code),
        .count(count)
    );

    bcd15seg i7 (
        .b(count[3:0]),
        .h(seg4)
    );

    bcd15seg i8 (
        .b(count[7:4]),
        .h(seg5)
    );

endmodule

