module CU 
(
input wire   clk,
input wire   BTNC, 
input wire   multiplierSign, 
input wire   multiplicandSign, 
input wire   multiplierLSB,
input wire   [7:0]multiplier,
input wire   [15:0]product_14,
output wire  [15:0] outputProduct,
output wire  mutiplierMutiplicandSelect,
output wire  load,
output wire  shift,
output wire  endCount,
output reg   savedSign,
output wire  LED0,
output wire  [3:0]count_4bit
);

  
  wire COUNT_Q;
  wire orResult;
  wire orCount;
  wire zeroFlag;
  wire FIRST_CLK;
  wire [3:0]count_4bit;
  wire BTNC_Q;
  wire LO_SH_OR_GATE;
  wire zero = 16'b0000_0000_0000_0000;
  wire one = 1'b1;
  
  assign orResult = |multiplier;
  assign zeroFlag = ~orResult;
  assign FIRST_CLK = (~|count_4bit);
  assign endCount = count_4bit[0]&count_4bit[3];//needs review
  assign LED0 = ~BTNC_Q;
  assign load = (FIRST_CLK|COUNT_Q)&BTNC_Q;
  assign shift = (~(FIRST_CLK|COUNT_Q))&BTNC_Q;
  assign mutiplierMutiplicandSelect = ~FIRST_CLK;
  
  always @ (posedge clk) 
    begin
         if(BTNC == 1)
         savedSign <= multiplierSign^multiplicandSign;
         else
         savedSign <= savedSign;
    end

  counter_4bit counter4(.clk(clk), .rst(BTNC), .en((shift&(~endCount))|FIRST_CLK),.count(count_4bit));
  counter_1bit counter1(.clk(clk), .rst(BTNC), .en(multiplierLSB|COUNT_Q), .count(COUNT_Q));
  t_flip_flop t_flip_flopx(.clk(BTNC|zeroFlag|endCount), .t(one), .q(BTNC_Q));
  mux_2x1_15bit mux_15(.data_0(zero),.data_1(savedSign?(~product_14+1):(product_14)),.sel(endCount),.out(outputProduct));
endmodule
