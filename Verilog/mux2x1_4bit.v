
module mux2x1_4bit(
    input [3:0] in1,
    input [3:0] in2,
    input sel,
    output out
    );
    assign out = sel ? in2 : in1;
endmodule