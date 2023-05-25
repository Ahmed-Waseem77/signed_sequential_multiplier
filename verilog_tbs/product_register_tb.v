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

module product_register_tb;

reg   [7:0]   aluResult;
reg           carryOut;
reg           clk;
reg           controlledRstSignal;
reg           load;
wire  [16:0]  product;
reg           rst;
reg   [7:0]   selectedLowerLoad;
reg           shiftRight;

product_register #(.n(8)) DUT (
.aluResult(aluResult),
.carryOut(carryOut),
.clk(clk),
.controlledRstSignal(controlledRstSignal),
.load(load),
.product(product),
.rst(rst),
.selectedLowerLoad(selectedLowerLoad),
.shiftRight(shiftRight)
);


initial forever #10 clk = ~clk;

initial begin

rst = 1;
clk = 1;
#10
rst = 0;
aluResult = 8'b10000000;
selectedLowerLoad = 8'b00001010;
carryOut = 1'b1;
#100
load = 1;
#100
load = 0;
#50
shiftRight = 1;
#50
shiftRight = 0;
#50
shiftRight = 1;
#50
shiftRight = 0;
#50
shiftRight = 1;
#50
shiftRight = 0;
#50
shiftRight = 1;
#50
shiftRight = 0;
#50
shiftRight = 1;
#50
shiftRight = 0;
#50
shiftRight = 1;
#50
shiftRight = 0;
#50
shiftRight = 1;
#50
shiftRight = 0;
#50
shiftRight = 1;
#50
shiftRight = 0;
#50
shiftRight = 1;
#50
shiftRight = 0;




end

endmodule