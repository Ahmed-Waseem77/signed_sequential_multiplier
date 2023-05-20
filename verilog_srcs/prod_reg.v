module prod_reg(
  input wire clk,
  input wire load,
  input wire shift,
  input wire rst,
  input wire [7:0] alu_in,
  input wire [7:0] multiplier,
  input wire sel,
  output wire [15:0] prod,
  output wire [15:0] reg_in
);

  wire [7:0] multiplier_half;
  wire [7:0] mult_out;
  
  // Instantiate components
  mux_2x1_8bit mux_sel 
  (
        .select(sel),
        .data0(multiplier),
        .data1(multiplier_half),
        .out(mult_out)
  );
  assign reg_in[15:0] = {alu_in[7:0], mult_out[7:0]};
  assign multiplier_half[7:0] = prod[7:0];
  
  shift_register shift_reg 
  (
        .clk(clk), 
        .load(load), 
        .shift_enable(shift),
        .data_in(reg_in),
        .data_out(prod)
  );

endmodule
