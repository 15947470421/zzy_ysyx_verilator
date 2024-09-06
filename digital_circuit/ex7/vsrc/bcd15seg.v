module bcd15seg(
    input  [3:0] b,
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

0: ABCDEF 0000_0011
1: BC
2: ABDEG
3: ABCDG
4: BCFG
5: ACDFG
6: ACDEFG
7: ABC
8: ABCDEFG
9: ABCDFG
a: ABCEFG
b: CDEFG
c: ADEF
d: BCDEG
e: ADEFG
f: AEFG

*/
    always @(b) begin
        case (b) // NVBoard's seg is different from
            4'h0 : h = 8'b0000_0011;
            4'h1 : h = 8'b1001_1111;
            4'h2 : h = 8'b0010_0101;
            4'h3 : h = 8'b0000_1101;
            4'h4 : h = 8'b1001_1001;
            4'h5 : h = 8'b0100_1001;
            4'h6 : h = 8'b0100_0001;
            4'h7 : h = 8'b0001_1111;
            4'h8 : h = 8'b0000_0001;
            4'h9 : h = 8'b0000_1001;
            4'ha : h = 8'b0001_0001;
            4'hb : h = 8'b1100_0001;
            4'hc : h = 8'b0110_0011;
            4'hd : h = 8'b1000_0101;
            4'he : h = 8'b0110_0001;
            4'hf : h = 8'b0111_0001;
        endcase
    end

endmodule
