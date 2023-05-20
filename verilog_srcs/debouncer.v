`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 01:07:22 PM
// Design Name: 
// Module Name: Debounce
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


module debouncer
(
    input wire clk, 
    input wire in, 
    output wire out
);

reg q1,q2,q3;

always@(posedge clk) 
begin
     q1 <= in;
     q2 <= q1;
     q3 <= q2; 
end
assign out = q1&q2&q3;
endmodule
