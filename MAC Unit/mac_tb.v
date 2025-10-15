`timescale 1ns / 1ps


module mac_unit_tb();
    reg clk, rst, load;
    reg [3:0] A, B;
    wire [8:0] F;
    
    mac_top uut(.clk(clk), .rst(rst), .load(load), .A(A), .B(B), .F(F));
    
    always #10 clk = ~clk;
    
    initial 
    begin
    clk = 0;
    rst = 1;
    load = 0;
    A = 4'b0000;
    B = 4'b0000;
    #20;
    rst = 0;
    A = 4'b1101;
    B = 4'b0111;
    load = 1;
    #20;
    A = 4'b0011;
    B = 4'b0100;
    #20;
    $finish;
    
    end
    
endmodule
