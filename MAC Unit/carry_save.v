`timescale 1ns / 1ps

module carry_save(
    input [7:0] A, B,
    output [7:0] sum,
    output carry
    );
    
    wire [7:0] S, C; 
    wire D1, D2, D3, D4, D5, D6, D7;

        half_adder ha0(.A(A[0]), .B(B[0]), .sum(S[0]), .carry(C[0]));
        half_adder ha1(.A(A[1]), .B(B[1]), .sum(S[1]), .carry(C[1]));
        half_adder ha2(.A(A[2]), .B(B[2]), .sum(S[2]), .carry(C[2]));
        half_adder ha3(.A(A[3]), .B(B[3]), .sum(S[3]), .carry(C[3]));
        half_adder ha4(.A(A[4]), .B(B[4]), .sum(S[4]), .carry(C[4]));
        half_adder ha5(.A(A[5]), .B(B[5]), .sum(S[5]), .carry(C[5]));
        half_adder ha6(.A(A[6]), .B(B[6]), .sum(S[6]), .carry(C[6]));
        half_adder ha7(.A(A[7]), .B(B[7]), .sum(S[7]), .carry(C[7]));
               
        assign sum[0] = S[0];
        
        half_adder ha8(.A(S[1]), .B(C[0]), .sum(sum[1]), .carry(D1));
        full_adder f1(.A(S[2]), .B(C[1]), .cin(D1), .sum(sum[2]), .cout(D2));
        full_adder f2(.A(S[3]), .B(C[2]), .cin(D2), .sum(sum[3]), .cout(D3));
        full_adder f3(.A(S[4]), .B(C[3]), .cin(D3), .sum(sum[4]), .cout(D4));
        full_adder f4(.A(S[5]), .B(C[4]), .cin(D4), .sum(sum[5]), .cout(D5));
        full_adder f5(.A(S[6]), .B(C[5]), .cin(D5), .sum(sum[6]), .cout(D6));
        full_adder f6(.A(S[7]), .B(C[6]), .cin(D6), .sum(sum[7]), .cout(D7));
        half_adder ha9(.A(C[7]), .B(D7), .sum(carry));
        
        
endmodule  