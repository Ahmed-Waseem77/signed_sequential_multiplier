`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 01:10:56 PM
// Design Name: 
// Module Name: full_adder_1
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


module full_adder_1(input cin, a, b, output sum, cout );
assign sum = a ^ b ^ cin;
assign cout = (cin & (a | b)) | (a & b);
endmodule


