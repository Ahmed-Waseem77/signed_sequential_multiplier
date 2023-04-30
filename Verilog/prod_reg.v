//
// Verilog Module signed_sequential_multiplier_lib.prod_reg
//
// Created:
//          by - ahmed.UNKNOWN (WES-HPOMEN)
//          at - 18:10:38 04/30/2023
//
// using Mentor Graphics HDL Designer(TM) 2023.1 Built on 19 Jan 2023 at 15:19:29
//

`resetall
`timescale 1ns/10ps
module prod_reg( 
   input   wire            alu_cout, 
   input   wire    [7:0]   alu_result, 
   input   wire            clk, 
   input   wire    [7:0]   multiplier, 
   input   wire            prod_load, 
   input   wire            prod_sign_extention, 
   output  wire    [16:0]  product, 
   input   wire            rst, 
   input   wire            shift_left_mulr, 
   input   wire            shift_right_mulr
);


// Internal Declarations
endmodule
