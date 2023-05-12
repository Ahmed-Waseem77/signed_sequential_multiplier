module mux_2x1_15bit(
  input [14:0] data_0,
  input [14:0] data_1,
  input sel,
  output reg [14:0] out
);

  always @* begin
    if (sel)
      out = data_1;
    else
      out = data_0;
  end

endmodule