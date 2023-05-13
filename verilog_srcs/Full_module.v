`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 09:55:39 PM
// Design Name: 
// Module Name: Full_module
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


module Full_module(input [7:0]mult, input [7:0]mcand, input clk, input PB_start, input [1:0]PB_scroll, output [10:0]out, output LED);
wire [15:0] f_product;
wire rst = 0;
wire start;
PB_detector S(.PB_signal(PB_start), .clk(clk), .rst(rst), .new_signal(start));
main M1(.clk(clk), .BTNC(start), .multiplier(mult), .multiplicand(mcand), .f_product(f_product), .LED0(LED));
Final_module M2(.clk(clk), .product(f_product[14:0]), .N(f_product[15]), .PB_signal(PB_scroll), .out(out));
endmodule
