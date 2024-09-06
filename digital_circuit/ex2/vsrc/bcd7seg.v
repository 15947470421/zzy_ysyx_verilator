module bcd7seg(
    input  [2:0] b,
    output reg [7:0] h
);
/*

NVBoard SEG
commen postive: when 0 light, when 1 close
  ======
   SEGxA 
||      || 
||SEGxF ||SEGxB
||      ||
  ====== 
   SEGxG
||      || 
||SEGxE ||SEGxC
||      ||
  ======   .DECxP
   SEGxD

0: ABCDEF
1: BC
2: ABDEG
3: ABCDG
4: BCFG
5: ACDFG
6: ACDEFG
7: ABC

*/
    always @(b) begin
        case (b) // NVBoard's seg is different from
            3'd0 : h = 8'b0000_0011;
            3'd1 : h = 8'b1001_1111;
            3'd2 : h = 8'b0010_0101;
            3'd3 : h = 8'b0000_1101;
            3'd4 : h = 8'b1001_1001;
            3'd5 : h = 8'b0100_1001;
            3'd6 : h = 8'b0100_0001;
            3'd7 : h = 8'b0001_1111;
        endcase
    end

endmodule
