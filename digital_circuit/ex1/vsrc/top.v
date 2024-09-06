module top(
  input [1:0]   x[4], // 有4个元素的数据宽度为2位的数组
  input [1:0]   s,
  output [1:0]  y
);

  MuxKey #(4, 2, 2) i0 (y, s, {
    2'b00, x[0],
    2'b01, x[1],
    2'b10, x[2],
    2'b11, x[3]
  });

endmodule

