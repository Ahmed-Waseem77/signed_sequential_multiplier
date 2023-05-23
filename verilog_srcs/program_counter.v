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
module program_counter
#(
  parameter n = 8
) 
( 
   input   wire      controlledRstSignal, 
   output  wire      lastBaughWooleyTerm, 
   input   wire      pcCount, 
   input   wire      rst
);

reg [n:0]   count;

always @(posedge pcCount or posedge rst) begin : COUNTER_BLOCK
  if(rst)
    count <= 0;
  else
    count <= count + 1; // concatenation ensures fixed bitwidth, counter behaviour will add 1 to LSB incase of overflow
    
    /* practically the counter will never overflow given its use in the circuit, yet if we want it to be bullet proof, we could
    just add a wire to take in the carry and when the carry is set we set the count to zero */
end


// ERR: Inferred Register with Asynchronous Reset, count not initialised with synchronous reset
// ffr: try removing resets replacing them with initial begin (did not work but worth another try).
always @ * begin
  if(controlledRstSignal)
    count <= 0;
  
end

assign lastBaughWooleyTerm = (count == n - 1);

endmodule
