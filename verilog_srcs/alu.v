//
// Verilog Module signed_sequential_multiplier_lib.ALU
//
// Created:
//          by - ahmed.UNKNOWN (WES-HPOMEN)
//          at - 22:09:29 04/23/2023
//
// using Mentor Graphics HDL Designer(TM) 2023.1 Built on 19 Jan 2023 at 15:19:29
//

`resetall
`timescale 1ns/10ps
module alu( 
   output  wire            alu_cout, 
   output  wire    [7:0]   alu_result, 
   input   wire            en, 
   input   wire    [8:15]  product, 
   input   wire    [7:0]   shifted_multiplicand
);


// Internal Declarations
assign alu_result = multiplicand + product;

// Internal Declarations
endmodule
