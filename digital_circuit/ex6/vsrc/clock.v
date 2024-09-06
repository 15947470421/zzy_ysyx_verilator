module clock (
    input clk_in,
    input rst,

    output reg clk_out
);


    parameter CLK_NUM = 5000000;
    reg[31:0] clk_counter;

    always @(posedge clk_in) begin
        if (rst) begin
            clk_counter <= 32'd0;
            clk_out <= 1'b0;
        end
        else if (clk_counter == CLK_NUM) begin
                clk_counter <= 32'd0;
                clk_out <= ~clk_out;
        end
        else
            clk_counter <= clk_counter + 1;
    end
    
endmodule //clock 
