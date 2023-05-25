//Signed Sequential Multiplier
//Copyright (C) 2023  Ahmed Waseem
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

`timescale 1ns/10ps

module alu_tb;

wire    [7:0]     aluResult;
wire              carryOut;
reg     [2:0]     aluSetting;
reg     [7:0]     multiplicand;
reg     [15:8]    product;

alu #(.n(8)) DUT (
.aluResult(aluResult),
.carryOut(carryOut),
.aluSetting(aluSetting),
.multiplicand(multiplicand),
.product(product)
);

initial begin
aluSetting = 3'b000;
multiplicand = 8'b1111_1011;
product = 8'b0000_0000;
#200
aluSetting = 3'b001;
multiplicand = 8'b1111_1011;
product = 8'b0000_0000;
#200
aluSetting = 3'b010;
multiplicand = 8'b1111_1011;
product = 8'b0000_0000;
#200
aluSetting = 3'b011;
multiplicand = 8'b1111_1011;
product = 8'b0000_0000;
#200
aluSetting = 3'b100;
multiplicand = 8'b1111_1011;
product = 8'b0000_0000;


end

endmodule