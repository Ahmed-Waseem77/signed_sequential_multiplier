`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2023 12:56:31 PM
// Design Name: 
// Module Name: clockDivider
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


module clock_divider #(parameter n = 50000000)
(
    input wire clk,
    output reg clk_out
 );
 
wire [31:0] count;
bin_counter #(32,n) ex (.clk(clk), .count(count));

always @ (posedge clk)
begin
    if (count == n-1)
        clk_out <= ~ clk_out;
end

endmodule
