// file: two_comp.v
// author: @barbary

`timescale 1ns/1ns

module two_comp(input [7:0]num, input invert, output [7:0]Comp);
assign Comp = invert ? (~num + 1) : num;
endmodule
