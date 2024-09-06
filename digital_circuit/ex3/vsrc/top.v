module top (
    input [3:0] a,
    input [3:0] b,
    input [2:0] op,

    output [3:0] result,
    output zero,
    output c_out,
    output of
);
    
    // ALU i0 (
    //     .a(a),
    //     .b(b),
    //     .op(op),
    //     .result(result),
    //     .zero(zero),
    //     .c_out(c_out),
    //     .of(of)
    // );

    ALU_behavior i0 (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .zero(zero),
        .c_out(c_out),
        .of(of)
    );


endmodule

