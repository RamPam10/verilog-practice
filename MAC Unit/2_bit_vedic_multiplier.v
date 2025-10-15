`timescale 1ns / 1ps

module two_bit_vedic_multiplier(
    input [1:0] A,B,
    output [3:0] F
    );
    
    wire [3:0] Z;
    
    and_gate a1 (.A(A[0]), .B(B[0]), .Y(F[0])); //F0
    
    and_gate a2 (.A(A[1]), .B(B[0]), .Y(Z[0]));
    and_gate a3 (.A(A[0]), .B(B[1]), .Y(Z[1]));
    half_adder h1 (.A(Z[0]), .B(Z[1]), .sum(F[1]), .carry(Z[2])); //F1
    
    and_gate a4 (.A(A[1]), .B(B[1]), .Y(Z[3]));
    half_adder h2 (.A(Z[2]), .B(Z[3]), .sum(F[2]), .carry(F[3])); //F2 & F3
    
endmodule