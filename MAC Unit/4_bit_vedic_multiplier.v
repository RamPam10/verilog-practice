`timescale 1ns / 1ps

module four_bit_vedic_multiplier(
    input [3:0] A,B,
    output [7:0] F
    );
    
    wire [3:0] f0,f1,f2,f3;
    wire [3:0] add_1;
    wire [5:0] add_2;
    
    wire [1:0] AH = A[3:2];
    wire [1:0] AL = A[1:0];
    wire [1:0] BH = B[3:2];
    wire [1:0] BL = B[1:0];
    
    
    two_bit_vedic_multiplier vm41( .A(AL), .B(BL), .F(f0));
    two_bit_vedic_multiplier vm42( .A(AH), .B(BL), .F(f1));
    two_bit_vedic_multiplier vm43( .A(AL), .B(BH), .F(f2));
    two_bit_vedic_multiplier vm44( .A(AH), .B(BH), .F(f3));
    
    assign F[1:0] = f0[1:0];
    assign add_1 = f1[3:0] + {2'b00,f0[3:2]};
    assign add_2 = {f3[3:0],2'b00} + {2'b00,f2[3:0]};
    assign F[7:2] = add_1 + add_2;
    
endmodule