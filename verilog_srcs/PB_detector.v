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


module PB_detector(input PB_signal, input clk, input rst, output new_signal);
wire c2, s1;
clockDivider #(50000) c1(.clk(clk), .rst(rst), .clk_out(c2));
Debounce D1(.clk(c2), .rst(rst), .in(PB_signal), .out(s1));
RE_detector R1(.level(s1), .clk(c2), .rst(rst), .tick(new_signal));
endmodule
