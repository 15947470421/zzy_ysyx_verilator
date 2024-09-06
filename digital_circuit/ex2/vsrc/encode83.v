module encode83(
    input [7:0] x,
    input  en,
    output reg [2:0] y,
    output reg in_val // input value bit
);

    integer i;
    always @(x or en) begin
        if (en) begin
            y = 0;
            for( i = 0; i <= 7; i = i + 1)
                if(x[i] == 1)    y = i[2:0];
        end
        else begin  
            y = 0;
        end
    end

    always @(x) begin
        if (x == 0) begin
            in_val = 1'b0;
        end
        else begin
            in_val = 1'b1;
        end
    end

endmodule
