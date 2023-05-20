`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 01:08:52 PM
// Design Name: 
// Module Name: PB_detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pb_detector
(
    input wire PB_signal, 
    input wire clk, 
    output wire new_signal
);

wire newClock, debounceSig;
clock_divider #(50000) c1(.clk(clk), .clk_out(newClock));
debouncer D1(.clk(newClock), .in(PB_signal), .out(debounceSig));
re_detector R1(.level(debounceSig), .clk(newClock), .tick(new_signal));
endmodule
