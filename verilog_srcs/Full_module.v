//Sequential Multiplier
//Copyright (C) 2023  Ahmed Waseem, Ahmed Elbarbary, yousef ElMahdy, Hussien ElHeggi
//
//This program is free software; you can redistribute it and/or
//modify it under the terms of the GNU General Public License
//as published by the Free Software Foundation; either version 2
//of the License, or (at your option) any later version.
//
//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.
//
//You should have received a copy of the GNU General Public License
//along with this program; If not, see <http://www.gnu.org/licenses/>.
// 

`timescale 1ns / 1ps
module Full_module(
    input wire [7:0]mult, 
    input wire [7:0]mcand, 
    input wire clk, 
    input wire PB_start, 
    input wire [1:0]PB_scroll, 
    output [10:0]out, 
    output LED
);

wire [15:0] fProduct;
wire rst = 0;
wire start;
reg  savedSignState = 0;

always @( start ) begin
    savedSignState <= fProduct[15];
end

pb_detector S(
    .PB_signal(PB_start),
    .clk(clk),
    .new_signal(start)
);

multiplier_main M1(
    .clk(clk),
    .BTNC(start),
    .multiplier(mult),
    .multiplicand(mcand),
    .f_product(fProduct),
    .LED0(LED)
);

display M2(
    .clk(clk),
    .product(fProduct[14:0]),
    .N(fProduct[15]),
    .PB_signal(PB_scroll),
    .out(out),
    .rst(BTNC)
);
endmodule
