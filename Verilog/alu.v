module alu(
   input [7:0] a,   // 8-bit operand A
   input [7:0] b,   // 8-bit operand B
   input cin,       // carry in
   input sub,       // subtract
   output [7:0] out,// 8-bit output
   output cout,     // carry out
   output [7:0] sum // 8-bit sum
   );
   
   // Declare wires for the two 4-bit sums
   wire [3:0] sum0, sum1, sum2, sumf;
   
   // Declare wires for the carry out of each 4-bit CLA adder
   wire cout0, cout1;
   
   // Declare wire for selecting which 4-bit CLA adder to use for the higher 4 bits
   wire sel;
   
   // Instantiate two 4-bit CLA adders, one with cin = 0 and one with cin = 1
   cla_adder cla0(.A(a[7:4]), .B(b), .cin(0), .sub(sub), .S(sum0), .cout(cout0));
   cla_adder cla1(.A(a[7:4]), .B(b), .cin(1), .sub(sub), .S(sum1), .cout(cout1));
   
   // Instantiate the lower 4-bit CLA adder with the carry in
   cla_adder cla2(.A(a[3:0]), .B(b), .cin(cin), .sub(sub), .S(sum2), .cout(sel));
   
   // Instantiate a 2-to-1 multiplexer to select between the 4-bit CLA adders for the higher 4 bits
   mux2x1_4bit mux1(.in1(sum1), .in2(sum2), .sel(sel), .out(sum));
   
   // Instantiate a 2-to-1 multiplexer to select between the carry out of each 4-bit CLA adder
   mux2x1 mux2(.a(cout0), .b(cout1), .sel(sel), .y(cout));
   // Instatiate a 2-to-1 multiplexer to select between the 4-bit CLA adders for the higher 4 bits
    mux2x1_4bit mux1(.in1(sum0), .in2(sum1), .sel(sel), .out(sumf));
   //combining the two 4-bit sums into one 8-bit sum
    sum = {sumf[3:0], sum2[3:0]};
   // Assign the 8-bit sum and output
   assign sum = {sum2[3:0], sum1[3:0]};
   assign out = sum;
endmodule
