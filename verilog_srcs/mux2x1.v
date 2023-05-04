#write code for 2by1 multiplexer
module mux2x1 (input a, b, sel, output y);
    assign y = (sel == 1'b0) ? a : b;
endmodule