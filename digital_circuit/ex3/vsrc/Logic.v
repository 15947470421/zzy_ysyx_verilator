module Logic (
    input [3:0] a,
    input [3:0] b,
    input [2:0] op,

    output [3:0] y
);

    wire [3:0] w_not;
    wire [3:0] w_and;
    wire [3:0] w_or;
    wire [3:0] w_xor;
    
    assign w_not = ~a;
    assign w_and = a & b;
    assign w_or  = a | b;
    assign w_xor = a ^ b;

    MuxKeyWithDefault #(4, 3, 4) i0 (y, op, 4'b0000, {
        3'b010, w_not,
        3'b011, w_and,
        3'b100, w_or, 
        3'b101, w_xor
    });

    /*这么写是否可以和上述的代码综合出一样的实际电路呢
    always @(*) begin
        case (op)
            3'b010: y = ~a;
            3'b011: y = a & b;
            3'b100: y = a | b;
            3'b101: y = a ^ b;
            defaulte : y = 4'b0000;
        endcase
    end
    */

endmodule
