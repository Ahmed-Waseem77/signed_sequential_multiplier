`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 02:13:15 PM
// Design Name: 
// Module Name: Twos_Comp
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


module Twos_Comp(input [15:0] num, output [15:0] Comp);
wire c;
RCA_16bit r1(.cin(1'd1), .a(~num), .b(16'b0), .sum(comp), .cout(c));
endmodule

