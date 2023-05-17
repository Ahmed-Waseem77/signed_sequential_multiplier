`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 12:56:58 PM
// Design Name: 
// Module Name: Final_module
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


module display(input wire [14:0]product, input wire rst ,input wire N, input wire clk ,input wire [1:0] PB_signal, output wire [10:0]out);
wire newClock;
wire [1:0] debounceSig;
wire [19:0] bcd;
wire [1:0]muxsel1;
wire sign;

signed_binary_to_bcd b1 (.bin(product), .N(N), .bcd(bcd));
clock_divider #(50000) c1(.clk(clk), .clk_out(newClock));
pb_detector A1(.PB_signal(PB_signal[0]), .clk(clk), .new_signal(debounceSig[0]));
pb_detector B1(.PB_signal(PB_signal[1]), .clk(clk), .new_signal(debounceSig[1]));



reg [1:0]state;
reg [1:0]nextState;
parameter  stateA = 2'b00, stateB = 2'b01, stateC = 2'b10;

always @ * begin 
    case(state)
        stateA: 
            if (debounceSig == 2'b01)
                nextState = stateB;
            else
                nextState = stateA;
                
        stateB:
            if (debounceSig == 2'b01)
                nextState = stateC;
            else if (debounceSig == 2'b10)
                nextState = stateA;
            else
                nextState = stateB;
                
        stateC:
            if (debounceSig == 2'b10)
                nextState = stateB;
            else
                nextState = stateC;
                
    endcase 
    
    
end
always @(posedge newClock, posedge rst)
begin
    if (rst)
        state <= stateA;
    else
        state <= nextState; 
end


assign muxsel1 = state;

reg [15:0]muxout1;

always @ (*)
begin
    
     if(N == 0)
        begin
            case(muxsel1)
                   2'b00: 
                   begin
                   muxout1[11:0] = bcd[19:8];
                   muxout1[15:12] = 4'b1111;
                   end
                   2'b01:
                   begin
                   muxout1[11:0] = bcd[15:4];
                   muxout1[15:12] = 4'b1111;
                   end
                   2'b10: 
                   begin
                   muxout1[11:0] = bcd[11:0];
                   muxout1[15:12] = 4'b1111;
                   end
                   default: muxout1 = 4'b1011;
            endcase
        end
     else
        begin
            case(muxsel1)
                   2'b00: 
                   begin
                   muxout1[11:0] = bcd[19:8];
                   muxout1[15:12] = 4'b1010;
                   end
                   2'b01: 
                   begin
                   muxout1[11:0] = bcd[15:4];
                   muxout1[15:12] = 4'b1010;
                   end
                   2'b10:
                   begin
                   muxout1[11:0] = bcd[11:0];
                   muxout1[15:12] = 4'b1010;
                   end
                   default: muxout1 = 4'b1011;
            endcase
        end
end

wire [1:0]muxsel2;
reg [3:0]binValue;
bin_counter #(2,4) b2 (.clk(newClock), .count(muxsel2));
bcd_to_7seg w1(.num(binValue),.in_anode(muxsel2),.segments(out[6:0]),.anode_active(out[10:7]));

always @ (*)
begin
    
        case(muxsel2)
            2'b00: binValue = muxout1[3:0];
            2'b01: binValue = muxout1[7:4];
            2'b10: binValue = muxout1[11:8];
            2'b11: binValue = muxout1[15:12];
        endcase
    
end


endmodule
