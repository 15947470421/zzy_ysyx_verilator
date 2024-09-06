module add4 (
    input [3:0] a,
    input [3:0] b,
    input       c_in,

    output [3:0] sum,
    output      zero,
    output      c_out,
    output      of
);

    assign { c_out, sum } = a + b + {3'b000, c_in};
    assign of = (a[3] == b[3]) && (sum[3] != a[3]);
    assign zero = ~(| sum);

endmodule
