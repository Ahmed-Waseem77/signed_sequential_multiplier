module counter_4bit(
    input clk,
    input reset,
    input en,
    output reg [3:0] count
    );

    always @(negedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else if (en)
            count <= count + 1;
    end

endmodule