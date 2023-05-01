//
// Verilog Module signed_sequential_multiplier_lib.control_unit
//
// Created:
//          by - ahmed.UNKNOWN (WES-HPOMEN)
//          at - 18:26:47 04/30/2023
//
// using Mentor Graphics HDL Designer(TM) 2023.1 Built on 19 Jan 2023 at 15:19:29
//

`resetall
`timescale 1ns/10ps
module control_unit( 
   // Port Declarations
   input   wire    [7:0]    alu_result, 
   input   wire             clk, 
   output  wire             en, 
   input   wire    [7:0]    multiplicand, 
   input   wire    [7:0]    multiplier, 
   output  wire             multiplier_load, 
   input   wire    [15:0]   previous_mcand, 
   input   wire    [15:0]   previous_mulr, 
   output  wire             prod_load, 
   output  wire             prod_sign_extention, 
   input   wire    [16:16]  product, 
   output  wire             rst, 
   output  wire    [7:0]    selected_load, 
   output  wire             shift_left_mcand, 
   output  wire             shift_left_mulr, 
   output  wire             shift_right_mcand, 
   output  wire             shift_right_mulr, 
   input   wire    [7:0]    shifted_multiplicand
);


// Internal Declarations




// ### Please start your Verilog code here ### 

endmodule
