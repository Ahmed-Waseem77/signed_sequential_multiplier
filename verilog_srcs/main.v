`timescale 1ns/1ns

module main(
  input clk, BTNC,
  input [7:0] multiplier, multiplicand,
  output [15:0] f_product,
  output LED0
);
  wire [7:0] adder_out, mult_out, w_multiplier, w_multiplicand;
  wire sel, load_w, shift_w, sign;
  wire [15:0]product_temp;

  two_comp multiplier_comp(.num(multiplier), .invert(multiplier[7]), .Comp(w_multiplier));
  two_comp multiplicand_comp(.num(multiplicand), .invert(multiplicand[7]), .Comp(w_multiplicand));
  mux_2x1_7bit mux_sel (.select(sel), .data1(w_multiplicand), .data0(8'b00000000), .out(mult_out));
  adder_7bit addxx (.A(product_temp[15:8]), .B(mult_out), .cin(1'b0), .S(adder_out));
  prod_reg product_reg (
    .clk(clk), .rst(BTNC), .load(load_w), .shift(shift_w), .alu_in(adder_out),
    .multiplier(w_multiplier), .sel(sel), .sign(sign), .prod(product_temp)
  );
  CU control_unit (.CLK(clk), .BTNC(BTNC), .MULTIPLIER(w_multiplier), .PRODUCT_14(product_temp),
  .MULR_LSB(product_temp[0]), .CU_LOAD(load_w), .CU_SHIFT(shift_w), .CU_SN_MR(multiplier[7]),
  .CU_SN_MD(multiplicand[7]), .CU_MUL_ZERO_SEL(sel), .LED0(LED0), .SIGN(sign), .OUTPUT_SEL(f_product)
  );
endmodule
