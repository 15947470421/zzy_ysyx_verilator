module key_counter(
    input clk,
    input rst,
    input [7:0] scan_code,
    output reg [7:0] count
);

    always @(posedge clk) begin
        if (rst) begin
            count <= 8'h0;
        end
        else if (scan_code == 8'hF0) begin
            count <= count + 8'h01;
        end
        else
            count <= count;
    end

endmodule //key_counter

