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

module twos_complement_multiplier_tb;


reg             clk;
reg    [7:0]    multiplicand;
reg    [7:0]    multiplier;
reg             rst;
reg             startButton;
wire            endOfMultiplication;
wire    [16:0]  product;
wire    [4:0]   current_state;
wire    [4:0]   next_state;


twos_complement_multiplier #(.n(8)) DUT 
(
.clk                  (clk), 
.multiplicand         (multiplicand), 
.multiplier           (multiplier), 
.rst                  (rst), 
.startButton          (startButton),
.endOfMultiplication  (endOfMultiplication),
.product              (product),
.current_state        (current_state),
.next_state           (next_state)
);

// clock driver
initial forever #5 clk = ~clk;


initial begin

// initialisations  //
rst = 1;
clk = 1;
multiplier = 8'b0001_1111;
multiplicand = 8'b1000_1111;
// answer <carry bit> 1111 0010 0101 0001
#10
rst = 0;
startButton = 0;
#10
//    //      //    //

// multiplication //

#40
startButton = 1;
#10
startButton = 0;

end

endmodule