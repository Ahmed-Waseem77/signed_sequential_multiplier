module counter_1bit
(
    input wire clk,
    input wire rst,
    input wire en,
    output reg count
);
    
    always @(posedge clk) begin
    if(rst)
        count <= 1'b0;
    else if (en)
        count <= ~count;
    end

endmodule