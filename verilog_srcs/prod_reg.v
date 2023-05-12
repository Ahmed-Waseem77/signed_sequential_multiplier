module prod_reg(
  input wire clk,
  input wire rst,
  input wire load,
  input wire shift,
  input wire [6:0] alu_in,
  input wire [6:0] multiplier,
  input wire sel,
  output wire [13:0] prod,
  output wire [13:0] reg_in
);

  wire [6:0] multiplier_half;
  wire [6:0] mult_out;
  
  // Instantiate components
  mux_2x1_7bit mux_sel (
    .select(sel),
    .data0(multiplier),
    .data1(multiplier_half),
    .out(mult_out)
  );
  assign reg_in[13:0] = {alu_in[6:0], multiplier[6:0]};
  assign multiplier_half[6:0] = reg_in[6:0];
  shift_register shift_reg (
    .clk(clk),
    .reset(rst),
    .load(load),
    .shift_enable(shift),
    .data_in(reg_in),
    .data_out(prod)
  );

endmodule
