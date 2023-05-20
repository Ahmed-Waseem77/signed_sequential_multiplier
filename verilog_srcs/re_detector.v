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


module re_detector
(
    input wire level, 
    input wire clk, 
    output wire tick
);

reg [1:0] state;
reg [1:0] nextState;
parameter [1:0] stateA = 2'b00, stateEdg = 2'b01, stateB = 2'b10;

always @ *
begin
case (state)
    stateA: if(level==0)
        nextState = stateA;
       else 
        nextState = stateEdg;
        
    stateEdg: if(level==0)
        nextState = stateA;
       else 
        nextState = stateB;
    stateB: if(level==0)
        nextState = stateA;
       else 
        nextState = stateB;
     default: nextState = stateA;    
endcase

end

always @(posedge clk)
begin
    state <= nextState; 
end

assign tick = (state == stateEdg);



endmodule