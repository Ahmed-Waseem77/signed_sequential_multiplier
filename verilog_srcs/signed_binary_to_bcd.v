`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 12:47:01 PM
// Design Name: 
// Module Name: signed_binary_to_bcd
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


module signed_binary_to_bcd(input [15:0] bin, input N, output reg [19:0] bcd);
wire [15:0]Comp;
Twos_Comp T(.num(bin), .Comp(Comp));
reg [15:0]tempbin;

always @(*)
begin
    case(N)
    0: tempbin = bin;
    1: tempbin = Comp;
    endcase
end      
integer i;
	
always @(tempbin) begin
    bcd=0;		 	
    for (i=0; i<16; i=i+1) begin					//Iterate once for each bit in input number
        if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
	if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
	if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
	if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
	if (bcd[19:16] >= 5) bcd[19:16] = bcd[19:16] + 3;

	bcd = {bcd[19:0],tempbin[15-i]};				//Shift one bit, and shift in proper bit from input 
    end
end
endmodule
