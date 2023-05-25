module counter_1bit(
    input clk,
    input reset,
    input en,
    output reg count
    );

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 1'b0;
        else if (en)
            count <= ~count;
    end

endmodule