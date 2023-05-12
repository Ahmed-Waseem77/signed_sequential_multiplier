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
  CU_ALU_MULR_SEL,
  OUTPUT_SEL,
  LED0, 
  END_COUNT,
  count_4bit
);

  input CLK, BTNC, CU_SN_MR, CU_SN_MD, MULR_LSB;
  input [6:0]MULTIPLIER;
  input [13:0]PRODUCT_14;
  output [14:0] OUTPUT_SEL;
  output CU_MUL_ZERO_SEL, CU_ALU_MULR_SEL;
  output CU_LOAD, CU_SHIFT,END_COUNT;
  output [3:0]count_4bit, LED0;
  
  wire COUNT_Q;
  wire orResult;
  wire zeroFlag;
  wire FIRST_CLK;
  wire [3:0]count_4bit;
  wire BTNC_Q;
  wire LO_SH_OR_GATE;
  
  assign orResult = |MULTIPLIER;
  assign zeroFlag = ~orResult;
  assign FIRST_CLK = &(~count_4bit);
  assign END_COUNT = count_4bit[1]&count_4bit[3];//needs review
  assign LED0 = count_4bit;
  assign LO_SH_OR_GATE = FIRST_CLK|COUNT_Q;
  assign CU_LOAD = LO_SH_OR_GATE&BTNC_Q;
  assign CU_SHIFT = (~LO_SH_OR_GATE)&BTNC_Q;
  assign CU_ALU_MULR_SEL = ~FIRST_CLK;
  assign CU_MUL_ZERO_SEL = ~FIRST_CLK;
  
  counter_4bit counter4(.clk(CLK),.reset(BTNC), .en((CU_SHIFT&(~END_COUNT))|FIRST_CLK),.count(count_4bit));
  counter_1bit counter1(.clk(CLK), .reset(BTNC), .en(MULR_LSB|COUNT_Q), .count(COUNT_Q));
  t_flip_flop t_flip_flopx(.clk(CLK), .reset(BTNC), .t(BTNC|zeroFlag|BTNC), .q(BTNC_Q));
  mux_2x1_15bit mux_15(.data_0(15'b0000_0000_0000_000),.data_1({CU_SN_MR^CU_SN_MD,PRODUCT_14}),.sel(END_COUNT),.out(OUTPUT_SEL));
endmodule
