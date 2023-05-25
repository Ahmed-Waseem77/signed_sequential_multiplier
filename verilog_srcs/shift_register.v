`timescale 1ns/1ns

module shift_register(
    input clk,
    input [15:0] data_in,
    input shift_enable,
    input load,
    input reset,

    output [15:0] data_out
    );

    reg [15:0] register;

    always @(negedge clk or posedge reset) begin
        if (reset)
            register <= 0;
        else if (load)
            register <= data_in;
            
        else if (shift_enable)
            register <= {1'b0,register[15:1]};
    end

    assign data_out = register;

endmodule