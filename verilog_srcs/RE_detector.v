`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 01:08:13 PM
// Design Name: 
// Module Name: RE_detector
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


module RE_detector(input level, input clk, input rst, output tick);
reg [1:0] state;
reg [1:0] next_state;
parameter [1:0] A = 2'b00, edg = 2'b01, B = 2'b10;
always @ *
begin
case (state)
    A: if(level==0)
        next_state = A;
       else 
        next_state = edg;
        
    edg: if(level==0)
        next_state = A;
       else 
        next_state = B;
    B: if(level==0)
        next_state = A;
       else 
        next_state = B;
     default: next_state = A;    
endcase

end

always @(posedge clk, posedge rst)
begin
if (rst)
    state <= A;
else
    state <= next_state; 
end

assign tick = rst ? 0: (state == edg);



endmodule