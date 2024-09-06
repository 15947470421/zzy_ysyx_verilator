module LFSR (
    input clk,
    input rst,
    input [7:0] din,
    input din_en,

    output reg [7:0] dout
);

    always @(posedge clk) begin
        if (rst) begin
            dout <= 8'd0;
        end
        else if (din_en == 1'd1) begin
            dout <= din;
        end
        else
            dout <= {dout[4] ^ dout[3] ^ dout [2] ^ dout[0], dout[7:1]};
    end

endmodule