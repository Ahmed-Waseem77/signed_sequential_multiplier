// file: two_comp.v
// author: @barbary

`timescale 1ns/1ns

module two_comp
(
  input  wire [7:0]num,
  input  wire invert,
  output wire [7:0]Comp
  );
  
assign Comp = invert ? (~num + 1) : num;
endmodule
