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
module product_register#(
  parameter n = 8,
  parameter m = n + n
) 
( 
   input   wire    [n-1:0]  aluResult, 
   input   wire             carryOut, 
   input   wire             clk, 
   input   wire             controlledRstSignal, 
   input   wire             load, 
   output  reg     [m:0]    product, 
   input   wire             rst, 
   input   wire    [n-1:0]  selectedLowerLoad, 
   input   wire             shiftRight
);


always @(posedge clk or posedge rst) begin : SIGNAL_HANDLING
  if(rst) begin
    product <= 0;
  end
    else if(load) begin
      product <= {carryOut, aluResult, selectedLowerLoad};
    end
    else if(shiftRight) begin
      product <= {1'b0, product[m:1]};
    end
    else
      product <= product;
  
end

// ERR: Inferred Register with Asynchronous Reset, product not initialised with synchronous reset
// ffr: try removing resets replacing them with initial begin (did not work but worth another try).
always @ * begin
  if (controlledRstSignal) begin
    product <= 0;
  end
end

endmodule
