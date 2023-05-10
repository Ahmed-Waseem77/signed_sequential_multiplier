`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 01:13:41 PM
// Design Name: 
// Module Name: RCA_16bit
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


module RCA_16bit(input cin, input [15:0] a, input [15:0] b, output [15:0] sum, output cout);
wire [16:0] c;
genvar i;
assign c[0] = cin;
generate
for (i = 0; i < 16; i = i + 1)
begin
full_adder_1 ex (.cin(c[i]), .a(a[i]), .b(b[i]), .sum(sum[i]), .cout(c[i+1]));
end
endgenerate
assign cout = c[16];
endmodule
