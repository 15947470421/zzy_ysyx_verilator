module Arithmetic (
    input [3:0] a,
    input [3:0] b,
    input [2:0] op,

    output [3:0] sum,
    output      zero,
    output      c_out,
    output      of
);

    wire w_sub;
    wire [3:0] w_b;

    assign w_sub = ((op == 3'b001) || (op == 3'b110) || (op == 3'b111)) ? 1 : 0;
    assign w_b = ( {4{w_sub}} ^ b );

    add4 i0 (
        .a(a),
        .b(w_b),
        .c_in(w_sub),
        .sum(sum),
        .zero(zero),
        .c_out(c_out),
        .of(of)
    );

endmodule
