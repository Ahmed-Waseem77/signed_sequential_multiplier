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

`timescale 1ns/1ns
module alu#(
  parameter n = 8,
  parameter m = n + n
) 
(
   output  reg     [n-1:0]  aluResult, 
   input   wire    [2:0]    aluSetting, 
   output  reg              carryOut, 
   input   wire    [n-1:0]  multiplicand, 
   input   wire    [n:0]    product
);


localparam  [n-1:0] zero = 0;
localparam  [m-1:n] baughWooleyCarries = {~zero[n-1], zero[n-2:1], ~zero[0]};



always @* begin : SIGNAL_HANDLING
  case(aluSetting)
  
    3'b000: {carryOut, aluResult} <= product[n-1:0] + {~(multiplicand[n-1]), multiplicand[n-2:0]};  // partial product + MSB inverted multiplicand
    3'b001: {carryOut, aluResult} <= product[n-1:0] + {~(zero[n-1]), zero[n-2:0]};                  // partial product + MSB inverted zero
    3'b010: {carryOut, aluResult} <= product[n-1:0] + {multiplicand[n-1], ~(multiplicand[n-2:0])};  // partial product + (MSB - Rest of the bits) inverted multiplicand
    3'b011: {carryOut, aluResult} <= product[n-1:0] + {zero[n-1], ~(zero[n-2:0])};                  // partial product + (MSB - Rest of the bits) inverted zero
    3'b100: {carryOut, aluResult} <= product[n-1:0] + baughWooleyCarries;
    default:
    {carryOut, aluResult} = product;

  endcase
end

endmodule

