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


module signed_binary_to_bcd
(
    input wire [14:0] bin,
    input wire N,
    output reg [19:0] bcd
);

wire [14:0]Comp;
twos_comp #(15)T(.num(bin), .Comp(Comp));
reg [14:0]tempBin;

always @(*)
begin
    case(N)
    0: tempBin = bin;
    1: tempBin = Comp;
    endcase
end      
integer i;
	
always @(tempBin) begin
    bcd=0;		 	
    for (i=0; i<15; i=i+1) begin					
        if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		
	if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
	if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
	if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
	if (bcd[19:16] >= 5) bcd[19:16] = bcd[19:16] + 3;

	bcd = {bcd[19:0],tempBin[14-i]};				
    end
end
endmodule
