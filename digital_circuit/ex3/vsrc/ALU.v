module ALU (
    input [3:0] a,
    input [3:0] b,
    input [2:0] op,

    output [3:0] result,
    output      zero,
    output      c_out,
    output      of
);

    wire [3:0] w_arithmatic;
    wire [3:0] w_logic;

    Arithmetic i0 (
        .a(a),
        .b(b),
        .op(op),
        .sum(w_arithmatic),
        .zero(zero),
        .c_out(c_out),
        .of(of)
    );

    Logic i1 (
        .a(a),
        .b(b),
        .op(op),
        .y(w_logic)
    );

    MuxKey #(8, 3, 4) i2 (result, op, {
        3'b000, w_arithmatic, // op=000: sum is Arithmetic output
        3'b001, w_arithmatic, // op=001: sub is Arithmetic output
        3'b010, w_logic, // op=010: not is Logic output
        3'b011, w_logic, // op=011: and is Logic output
        3'b100, w_logic, // op=100: or is Logic output
        3'b101, w_logic, // op=101: xor is Logic output
        3'b110, {3'b000, w_arithmatic[3] ^ of}, // op=110: compare is Arithmetic output
        3'b111, {3'b000, zero} // op=111: equare is Arithmetic output
    });

endmodule


module ALU_behavior (
    input [3:0] a,
    input [3:0] b,
    input [2:0] op,

    output reg [3:0] result,
    output reg      zero,
    output reg      c_out,
    output reg      of
);

    always begin
        case (op)
            3'b000: begin
                { c_out, result } = a + b; // op=000: sum
                zero = (result == 4'd0) ? 1 : 0;
                of = (a[3] == b[3]) && (result[3] != a[3]); 
            end
            3'b001: begin
                { c_out, result } = a - b;  // op=001: sub
                zero = (result == 4'd0) ? 1 : 0; 
                of = (a[3] == b[3]) && (result[3] != a[3]); 
            end
            3'b010: begin
                result = ~a;  // op=010: not a
                c_out = 1'd0;
                zero = 1'd0;
                of = 1'd0;
            end
            3'b011: begin
                result = a & b; // op=011: and
                c_out = 1'd0;
                zero = 1'd0;
                of = 1'd0;
            end
            3'b100: begin
                result = a | b;  // op=100: or
                c_out = 1'd0;
                zero = 1'd0;
                of = 1'd0;
            end
            3'b101: begin
                result = a ^ b; // op=101: xor
                c_out = 1'd0;
                zero = 1'd0;
                of = 1'd0;
            end
            3'b110: begin
                result = (a < b) ? 1 : 0; // op=110: compare
                c_out = 1'd0;
                zero = 1'd0;
                of = 1'd0;
            end
            3'b111: begin
                result = (a == b) ? 1 : 0; // op=111: equare
                c_out = 1'd0;
                zero = 1'd0;
                of = 1'd0;
            end
        endcase
    end

endmodule
