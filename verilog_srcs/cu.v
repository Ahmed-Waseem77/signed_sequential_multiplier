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
module cu( 

   output  reg     [2:0]  aluSetting, 
   input   wire           clk, 
   output  reg            controlledRstSignal, 
   output  reg            endOfMultiplication, 
   output  reg            initialiseMultiplier, 
   input   wire           lastBaughWooleyTerm, 
   output  reg            load, 
   input   wire           normalizedStartButton, 
   output  reg            pcCount, 
   input   wire    [0:0]  product, 
   input   wire           rst, 
   output  reg            shiftRight,
   output  reg      [3:0] current_state,
   output  reg      [3:0] next_state
);


// State encoding
parameter 
          start                      = 4'd0,
          addInvertedMsbMultiplicand = 4'd1,
          addInvertedMsbZero         = 4'd2,
          addLastMultiplicand        = 4'd3,
          addLastZero                = 4'd4,
          lastShift                  = 4'd5,
          addBaughWooleyCarries      = 4'd6,
          endOfMult                  = 4'd7,
          shift                      = 4'd8,
          controlledReset            = 4'd9,
          shiftBuffer                = 4'd10,
          transitionaryBuffer        = 4'd11;

// reg [3:0] current_state, next_state;

always @(
   current_state, 
   lastBaughWooleyTerm, 
   normalizedStartButton, 
   product
)
begin : STATE_TRANSITION
   case (current_state) 
      start: begin
         if (normalizedStartButton == 1)
            if (product[0] == 1'b1)
               next_state <= addInvertedMsbMultiplicand;
            else
               next_state <= addInvertedMsbZero;
         else
            next_state <= start;
      end
      addInvertedMsbMultiplicand: begin
         next_state <= shift;
      end
      addInvertedMsbZero: begin
         next_state <= shift;
      end
      addLastMultiplicand: begin
         next_state <= lastShift;
      end
      addLastZero: begin
         next_state <= lastShift;
      end
      lastShift: begin
         next_state <= addBaughWooleyCarries;
      end
      addBaughWooleyCarries: begin
         next_state <= endOfMult;
      end
      endOfMult: begin
         if (normalizedStartButton == 1)
            next_state <= controlledReset;
         else
            next_state <= endOfMult;
      end
      shift: begin
         if (lastBaughWooleyTerm == 1)
            next_state <= transitionaryBuffer;
         else
            next_state <= shiftBuffer;
      end
      controlledReset: begin
         next_state <= start;
      end
      shiftBuffer: begin
         if (product[0] == 1'b1)
            next_state <= addInvertedMsbMultiplicand;
         else
            next_state <= addInvertedMsbZero;
      end
      transitionaryBuffer: begin
         if (product[0] == 1)
            next_state <= addLastMultiplicand;
         else
            next_state <= addLastZero;
      end
      default: 
         next_state <= start;
   endcase
end 

always @(
   current_state
)
begin : STATE_OUTPUT

   // Combined Actions
   case (current_state) 
      start: begin
         pcCount <= 0;
         load <= 1;
         initialiseMultiplier <= 1;
         controlledRstSignal <= 0;
         shiftRight <= 0;
         endOfMultiplication <= 0;
         aluSetting <= 3'b111; // default state: product remains the same
      end
      addInvertedMsbMultiplicand: begin
         // defaults
         controlledRstSignal <= 0;
         endOfMultiplication <= 0;
         //
         pcCount <= 0;
         load <= 1;
         shiftRight <= 0;
         initialiseMultiplier <= 0;
         aluSetting <= 3'b000;
      end
      addInvertedMsbZero: begin
         // defaults
         controlledRstSignal <= 0;
         endOfMultiplication <= 0;
         //
         pcCount <= 0;
         load <= 1;
         shiftRight <= 0;
         initialiseMultiplier <= 0;
         aluSetting <= 3'b001;
      end
      addLastMultiplicand: begin
         // defaults
         pcCount <= 0;
         initialiseMultiplier <= 0;
         controlledRstSignal <= 0;
         shiftRight <= 0;
         endOfMultiplication <= 0;
         //
         load <= 1;
         aluSetting <= 3'b010;
      end
      addLastZero: begin
         // defaults
         pcCount <= 0;
         initialiseMultiplier <= 0;
         controlledRstSignal <= 0;
         shiftRight <= 0;
         endOfMultiplication <= 0;
         //
         load <= 1;
         aluSetting <= 3'b011;
      end
      lastShift: begin
         // defaults
         pcCount <= 0;
         initialiseMultiplier <= 0;
         controlledRstSignal <= 0;
         endOfMultiplication <= 0;
         aluSetting <= 3'b111;
         //
         load <= 0;
         shiftRight <= 1;
      end
      addBaughWooleyCarries: begin
         // defaults
         pcCount <= 0;
         initialiseMultiplier <= 0;
         controlledRstSignal <= 0;
         endOfMultiplication <= 0;
         //
         load <= 1;
         shiftRight <= 0;
         aluSetting <= 3'b100;
      end
      endOfMult: begin
         // defaults
         pcCount <= 0;
         initialiseMultiplier <= 0;
         controlledRstSignal <= 0;
         shiftRight <= 0;
         aluSetting <= 3'b111;
         //
         load <= 0;
         endOfMultiplication <= 1;
      end
      shift: begin
         // defaults
         initialiseMultiplier <= 0;
         controlledRstSignal <= 0;
         endOfMultiplication <= 0;
         aluSetting <= 3'b111;
         //
         pcCount <= 1;
         load <= 0;
         shiftRight <= 1;
      end
      controlledReset: begin
         // defaults
         pcCount <= 0;
         load <= 0;
         initialiseMultiplier <= 0;
         shiftRight <= 0;
         endOfMultiplication <= 0;
         aluSetting <= 3'b111;
         //
         controlledRstSignal <= 1;
      end
      shiftBuffer: begin
         // defaults
         initialiseMultiplier <= 0;
         controlledRstSignal <= 0;
         shiftRight <= 0;
         endOfMultiplication <= 0;
         //
         pcCount <= 0;
         aluSetting <= 3'b111;    // to default state
         load <= 1;
      end
      transitionaryBuffer: begin
         // defaults
         initialiseMultiplier <= 0;
         controlledRstSignal <= 0;
         endOfMultiplication <= 0;
         aluSetting <= 3'b111;
         //
         pcCount <= 0;
         load <= 1;
         shiftRight <= 0;
      end
      default: begin
         initialiseMultiplier <= 0;
         controlledRstSignal <= 0;
         endOfMultiplication <= 0;
         aluSetting <= 3'b111;
         pcCount <= 0;
         load <= 0;
         shiftRight <= 0;
      end
   endcase
end 

// ERR: Inferred Register with Asynchronous Reset, current_state not initialised with synchronous reset
// ffr: try removing resets replacing them with initial begin (did not work but worth another try).
always @(
   posedge clk or posedge rst
)
begin : STATE_DRIVER
   if (rst) begin
      current_state <= 4'd0;
   end
   else 
   begin
      current_state <= next_state;
   end
end 

endmodule 
