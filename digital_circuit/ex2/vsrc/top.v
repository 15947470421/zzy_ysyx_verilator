module top(
    input  [7:0]  x,
    input         en,
    output [2:0]  y,
    output        in_val,
    output [7:0]  seg0
);

    encode83 i0 (
        .x(x),
        .en(en),
        .y(y),
        .in_val(in_val)
    );

    wire [2:0] enc2seg;

    bcd7seg i1 (
        .b(y),
        .h(seg0)
    );

endmodule

