`timescale 1ns/1ns

module adder_7bit(
    input [6:0] A, B,     // 14-bit operands
    input cin,             // carry in
    output [6:0] S,       // 14-bit sum
    output cout            // carry out
    );

    wire [6:0] C;         // carry signals for each bit
    wire [6:0] C_out;     // carry out for each full adder
    
    // Generate the carry signals using generate block
    genvar i;
    generate
        for (i = 0; i < 7; i = i + 1) begin : carry_gen
            full_adder fa(
                .a(A[i]),
                .b(B[i]),
                .cin(C[i]),
                .sum(S[i]),
                .cout(C_out[i])
            );
        end
    endgenerate
    
    // Connect the carry signals
    assign C[0] = cin;
    assign C[6:1] = C_out[5:0];
    assign cout = C_out[6];
    
endmodule