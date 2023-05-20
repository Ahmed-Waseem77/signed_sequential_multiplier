`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2023 01:03:54 PM
// Design Name: 
// Module Name: bcd_to_7seg
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


module bcd_to_7seg 
(
    input wire [3:0] num, 
    input wire [0:1] in_anode, 
    output reg [0:6] segments, 
    output reg [0:3] anode_active
);

always @ (*) begin
    case(in_anode)
        2'b00: anode_active=4'b1110;
        2'b01: anode_active=4'b1101;
        2'b10: anode_active=4'b1011;
        2'b11: anode_active=4'b0111;
    endcase
       
    case(num)
        0: segments = 7'b0000001;
        1: segments = 7'b1001111;
        2: segments = 7'b0010010;
        3: segments = 7'b0000110;
        4: segments = 7'b1001100;
        5: segments = 7'b0100100;
        6: segments = 7'b0100000;
        7: segments = 7'b0001111;
        8: segments = 7'b0000000;
        9: segments = 7'b0001100;
        10: segments = 7'b1111110;
        11: segments = 7'b0110000;
        15: anode_active[3] = 1;
        default: segments = 7'b1111111;
     endcase
end 
endmodule
