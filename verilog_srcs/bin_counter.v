`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2023 12:55:34 PM
// Design Name: 
// Module Name: bin_counter
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


module bin_counter #(parameter x = 4, n = 10)(input wire clk,  output reg [x-1:0]count);
wire reset = 1'b0;
wire en = 1'b1;
always @(posedge clk, posedge reset)
begin
 if (reset == 1)
 begin
 count <= 0;
 end
 
 else if(en == 1)
 begin
 if (count == n-1)
 count <= 0;
 else
 count <= count + 1;
 end
end
endmodule
