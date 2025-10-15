`timescale 1ns / 1ps

module mac_top(
    input clk, rst,
    input [3:0] A,
    input [3:0] B,
    input load,
    output [8:0] F
    );
    
wire [7:0] a, sum;
wire carry;
wire [8:0] sum_f;
wire [8:0] b;

four_bit_vedic_multiplier vm(.A(A), .B(B), .F(a));
accumulator ac (.clk(clk), .rst(rst), .load(load), .data_in(sum_f), .data_out(b));
carry_save csa (.A(a), .B(b[7:0]), .sum(sum), .carry(carry));

assign sum_f = {carry,sum};
assign F = b;
endmodule
