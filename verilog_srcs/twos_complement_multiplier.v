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
module twos_complement_multiplier #(
   parameter n = 8,
   parameter m = n+n
)
( 
   input   wire             clk, 
   input   wire    [n-1:0]  multiplicand, 
   input   wire    [n-1:0]  multiplier, 
   input   wire             rst, 
   input   wire             startButton, 
   output  wire             endOfMultiplication, 
   output  wire    [m:0]    product,
   output  wire    [4:0]    current_state,
   output  wire    [4:0]    next_state

);

wire  [n-1:0] aluResult;
wire  [2:0]   aluSetting;
wire          carryOut;
wire          controlledRstSignal;
wire          dividedClk;
wire          initialiseMultiplier;
wire          lastBaughWooleyTerm;
wire          load;
wire          normalizedStartButton;
wire          pcCount;
wire  [n-1:0] selectedLowerLoad;
wire          shiftRight;

alu alu_main( 
   .aluSetting   (aluSetting), 
   .multiplicand (multiplicand), 
   .product      (product[m:n]), 
   .aluResult    (aluResult), 
   .carryOut     (carryOut)
); 

/* clock_divder clkd_main( 
   .clk        (clk), 
   .rst        (rst), 
   .dividedClk (dividedClk)
); */

cu cu_main( 
   .clk                   (clk), 
   .lastBaughWooleyTerm   (lastBaughWooleyTerm), 
   .normalizedStartButton (startButton), 
   .product               (product[0]), 
   .rst                   (rst), 
   .aluSetting            (aluSetting), 
   .controlledRstSignal   (controlledRstSignal), 
   .endOfMultiplication   (endOfMultiplication), 
   .initialiseMultiplier  (initialiseMultiplier), 
   .load                  (load), 
   .pcCount               (pcCount), 
   .shiftRight            (shiftRight),
   .current_state         (current_state),
   .next_state            (next_state)
); 

mux mux_main( 
   .initialiseMultiplier (initialiseMultiplier), 
   .multiplier           (multiplier), 
   .product              (product[n-1:0]), 
   .selectedLowerLoad    (selectedLowerLoad[n-1:0])
); 

product_register pr_main( 
   .aluResult           (aluResult), 
   .carryOut            (carryOut), 
   .clk                 (clk), 
   .controlledRstSignal (controlledRstSignal), 
   .product             (product), 
   .rst                 (rst), 
   .load                (load), 
   .shiftRight          (shiftRight), 
   .selectedLowerLoad   (selectedLowerLoad[n-1:0])
); 

program_counter pc_main( 
   .controlledRstSignal (controlledRstSignal), 
   .pcCount             (pcCount), 
   .rst                 (rst), 
   .lastBaughWooleyTerm (lastBaughWooleyTerm)
); 

/* push_button_detector pbd_main( 
   .dividedClk            (dividedClk), 
   .rst                   (rst), 
   .startButton           (startButton), 
   .normalizedStartButton (normalizedStartButton)
); */


endmodule

