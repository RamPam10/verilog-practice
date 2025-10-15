`timescale 1ns / 1ps

module accumulator(
    input clk,
    input rst,
    input load,
    input [8:0] data_in,
    output [8:0] data_out
    );
    
    reg [8:0] data;
    
    always @(posedge clk or posedge rst)
        begin
        if (rst)
            data <= 9'b0;
            
        else if (load)
            data <= data_in;
            
        else 
            data <= 0;
        end
        
    assign data_out = data;

        
endmodule
