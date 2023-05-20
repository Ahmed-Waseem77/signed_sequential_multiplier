`timescale 1ns/1ns

module multiplier_main
(
input wire           clk,
input wire           BTNC,
input wire  [7:0]    multiplier,
input wire  [7:0]    multiplicand,
output wire [15:0]   f_product,
output wire          dispSign,
output wire          LED0
);
  wire [7:0] adderOut, mult_out, w_multiplier, w_multiplicand;
  wire sel, load_w, shift_w, sign;
  wire [15:0]product_temp;
  wire [7:0]zero_8bit = 8'b00000000;
  wire zero_1bit = 1'b0;
  
  two_comp multiplier_comp
  (
        .num(multiplier),
        .invert(multiplier[7]),
        .Comp(w_multiplier)
  );
  two_comp multiplicand_comp
  (
        .num(multiplicand),
        .invert(multiplicand[7]),
        .Comp(w_multiplicand)
);
  mux_2x1_8bit mux_sel 
(
        .select(sel),
        .data1(w_multiplicand),
        .data0(zero_8bit),
        .out(mult_out)
);
  adder_8bit alu 
(
        .A(product_temp[15:8]),
        .B(mult_out), 
        .cin(zero_1bit), 
        .S(adderOut)
);
prod_reg product_reg 
(
        .clk(clk),
        .rst(BTNC), 
        .load(load_w), 
        .shift(shift_w), 
        .alu_in(adderOut),
        .multiplier(w_multiplier), 
        .sel(sel), 
        .prod(product_temp)
);
CU control_unit 
(
        .clk(clk), 
        .BTNC(BTNC), 
        .multiplier(w_multiplier), 
        .product_14(product_temp),
        .multiplierLSB(product_temp[0]), 
        .load(load_w), 
        .shift(shift_w), 
        .multiplierSign(multiplier[7]),
        .multiplicandSign(multiplicand[7]), 
        .mutiplierMutiplicandSelect(sel), 
        .LED0(LED0), 
        .savedSign(dispSign), 
        .outputProduct(f_product)
  );
endmodule
