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


module twos_comp  #(parameter x = 15)(input wire [x-1:0]num, output wire [x-1:0]Comp);
assign Comp = ~num + 1;
endmodule

