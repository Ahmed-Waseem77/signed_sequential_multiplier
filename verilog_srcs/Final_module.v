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


module Final_module(input [14:0]product, input N, input clk, input [1:0] PB_signal, output [10:0]out);
wire rst = 0;
wire nc;
wire [1:0] s;
wire [19:0] bcd;
reg [1:0]muxsel1;
signed_binary_to_bcd b1 (.bin(product), .N(N), .bcd(bcd));
clockDivider #(50000) c1(.clk(clk), .rst(rst), .clk_out(nc));
PB_detector A1(.PB_signal(PB_signal[0]), .clk(clk), .rst(rst), .new_signal(s[0]));
PB_detector B1(.PB_signal(PB_signal[1]), .clk(clk), .rst(rst), .new_signal(s[1]));



reg [1:0]state;
reg [1:0]next_state;
parameter  A = 2'b00, B = 2'b01, C = 2'b11;

always @ *
begin
    //state = next_state;
    if (N == 0)
        begin
            case (state)
            A: if(s==2'b01)
                begin
                next_state = B;
                muxsel1 = 2'b11;
                end
               else 
               begin
                next_state = A;
                muxsel1 = 2'b00;
               end
                
            B: if(s==2'b10)
                begin
                next_state = A; 
                muxsel1 = 2'b00;
                end
               else 
               begin
                next_state = B;
                muxsel1 = 2'b11;
                end
            
             default: next_state = A;    
             endcase
    end
    else
        begin
            case (state)
                A: if(s==2'b01)
                    begin
                    next_state = B;
                    muxsel1 = 2'b01;
                    end
                   else 
                   begin
                    next_state = A;
                    muxsel1 = 2'b00;
                   end
                    
                B: if(s==2'b10)
                    begin
                    next_state = A; 
                    muxsel1 = 2'b00;
                    end
                   else if(s==2'b01) 
                   begin
                    next_state = C;
                    muxsel1 = 2'b11;
                    end
                    else
                    begin
                    next_state = B;
                    muxsel1 = 2'b01;
                    end
                    
                C:if(s==2'b10)
                    begin
                    next_state = B; 
                    muxsel1 = 2'b01;
                    end
                   else 
                   begin
                    next_state = C;
                    muxsel1 = 2'b11;
                    end
                
                 default: next_state = A;    
                 endcase
        end 
end

always @(posedge nc, posedge rst)
begin
if (rst)
    state <= A;
else
    state <= next_state; 
end

reg [15:0]muxout1;
reg [11:0]temp;
always @ (*)
begin
     if(N == 0)
        begin
            case(muxsel1)
               2'b00: muxout1 = bcd[19:4];
               2'b11: muxout1 = bcd[15:0];
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
                   2'b01: muxout1 = bcd[19:4];
                   2'b11: muxout1 = bcd[15:0];
                   default: muxout1 = 4'b1011;
            endcase
        end
end

wire [1:0]muxsel2;
reg [3:0]binValue;
bin_counter #(2,4) b2 (.clk(nc), .reset(rst), .en(1'b1), .count(muxsel2));
bcd_to_7seg w1(.en(1'b1), .num(binValue),.in_anode(muxsel2),.segments(out[6:0]),.anode_active(out[10:7]));

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
