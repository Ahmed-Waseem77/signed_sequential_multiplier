module counter_4bit
(
    input wire clk,
    input wire rst,
    input wire en,
    output reg [3:0] count
);

  
    always @(negedge clk) begin
    if(rst)
        count <= 4'b0000;
    else if (en)
        count <= count + 1;
    end

endmodule