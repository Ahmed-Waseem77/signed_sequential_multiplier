`timescale 1ns/1ns

module mux_2x1_7bit(
    input [6:0] data0,
    input [6:0] data1,
    input select,
    output reg [6:0] out
    );

    always @ (data0, data1, select) begin
        case (select)
            1'b0: out = data0;
            1'b1: out = data1;
            default: out = 7'b0; // Optional default case if needed
        endcase
    end

endmodule
