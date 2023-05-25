module mux_2x1_15bit(
  input [15:0] data_0,
  input [15:0] data_1,
  input sel,
  output reg [15:0] out
);

  always @* begin
    if (sel)
      out = data_1;
    else
      out = data_0;
  end

endmodule
