module CU (
  CLK,
  BTNC,
  MULTIPLIER,
  PRODUCT_14,
  MULR_LSB,
  CU_LOAD,
  CU_SHIFT,
  CU_SN_MR,
  CU_SN_MD,
  CU_MUL_ZERO_SEL,
  OUTPUT_SEL,
  LED0, 
  END_COUNT,
  count_4bit,
  SIGN
);

  input  CLK, BTNC, CU_SN_MR, CU_SN_MD, MULR_LSB;
  input [7:0]MULTIPLIER;
  input [15:0]PRODUCT_14;
  output [15:0] OUTPUT_SEL;
  output CU_MUL_ZERO_SEL;
  output CU_LOAD, CU_SHIFT,END_COUNT, SIGN, LED0;
  output [3:0]count_4bit;
  
  wire COUNT_Q;
  wire orResult;
  wire orCount;
  wire zeroFlag;
  wire FIRST_CLK;
  wire [3:0]count_4bit;
  wire BTNC_Q;
  wire LO_SH_OR_GATE;
  
  assign orResult = |MULTIPLIER;
  assign zeroFlag = ~orResult;
  assign FIRST_CLK = (~|count_4bit);
  assign END_COUNT = count_4bit[0]&count_4bit[3];//needs review
  assign LED0 = ~BTNC_Q;
  assign CU_LOAD = (FIRST_CLK|COUNT_Q)&BTNC_Q;
  assign CU_SHIFT = (~(FIRST_CLK|COUNT_Q))&BTNC_Q;
  assign CU_MUL_ZERO_SEL = ~FIRST_CLK;
  assign SIGN = CU_SN_MR^CU_SN_MD;
  

  counter_4bit counter4(.clk(CLK),.reset(BTNC), .en((CU_SHIFT&(~END_COUNT))|FIRST_CLK),.count(count_4bit));
  counter_1bit counter1(.clk(CLK), .reset(BTNC), .en(MULR_LSB|COUNT_Q), .count(COUNT_Q));
  t_flip_flop t_flip_flopx(.clk(BTNC|zeroFlag|END_COUNT), .t(1'b1), .q(BTNC_Q));
  mux_2x1_15bit mux_15(.data_0(16'b0000_0000_0000_0000),.data_1({SIGN,PRODUCT_14[14:0]}),.sel(END_COUNT),.out(OUTPUT_SEL));
endmodule
