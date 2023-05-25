module t_flip_flop(
  input clk,
  input t,
  output reg q
);
initial begin
  q = 0;
end
  always @(posedge clk) begin
    if (t) 
      q <= ~q;
  end

endmodule
