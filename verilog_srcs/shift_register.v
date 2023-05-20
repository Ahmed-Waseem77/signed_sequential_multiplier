`timescale 1ns/1ns

module shift_register
(
    input  wire clk,
    input  wire [15:0] data_in,
    input  wire shift_enable,
    input  wire load,
    output wire [15:0] data_out
);
    
    reg [15:0] register;
    
    always @(negedge clk) 
    begin
         if (load)
            register <= data_in;    
        else if (shift_enable)
            register <= {1'b0,register[15:1]};
    end

    assign data_out = register;

endmodule