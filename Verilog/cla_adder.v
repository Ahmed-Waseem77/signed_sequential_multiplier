    module cla_adder(
    input [3:0] A, B,     // 4-bit operands
    input cin,            // carry in
    input sub,            // subtract
    output [3:0] S,       // 4-bit sum
    output cout           // carry out
    );

    wire [3:0] P, G;       // generate and propagate signals
    wire [2:0] C;          // carry signals for the look-ahead logic
    wire [3:0] C_out;      // carry out for each full adder
    wire [3:0] B_in;      // inverted B for subtraction
    
    // Generate the propagate and generate signals for each bit
    assign P = A ^ B;
    assign G = A & B;
    always @ (sub)
        if (sub)
        assign B_in = (~B)+1;
        
        else
        assign B_in = B;
    // Generate the carry signals using the look-ahead logic
    assign C[0] = cin;
    assign C[1] = G[0] | (P[0] & cin);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    
    // Generate the 4-bit sum using the carry signals
    full_adder fa0(.a(A[0]), .b(B_in[0]), .cin(cin), .sum(S[0]), .cout(C_out[0]));
    full_adder fa1(.a(A[1]), .b(B_in[1]), .cin(C[0]), .sum(S[1]), .cout(C_out[1]));
    full_adder fa2(.a(A[2]), .b(B_in[2]), .cin(C[1]), .sum(S[2]), .cout(C_out[2]));
    full_adder fa3(.a(A[3]), .b(B_in[3]), .cin(C[2]), .sum(S[3]), .cout(C_out[3]));
    
    // Generate the final carry-out signal
    assign cout = C_out[3];

    endmodule
