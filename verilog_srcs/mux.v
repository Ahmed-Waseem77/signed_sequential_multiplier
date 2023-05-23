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
module mux
#(
  parameter n = 8
)
( 
   input   wire             initialiseMultiplier, 
   input   wire    [n-1:0]  multiplier, 
   input   wire    [n-1:0]  product, 
   output  wire    [n-1:0]  selectedLowerLoad
);

assign selectedLowerLoad = initialiseMultiplier ? multiplier : product;

endmodule
