`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2023 09:34:14 AM
// Design Name: 
// Module Name: simulare
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module simulare();
    reg B1,B2,B3,clk,reset;
    wire cafea,rest;
    
    automat_cafea automat(B1,B2,B3,clk,reset,cafea,rest);
    always #20 clk = ~clk;
    
    initial begin
        B1 = 0;
        B2 = 0;
        B3 = 0;
        clk = 0;
        reset = 1;
        #30 B1 = 1; B2 = 0; B3 = 0; reset = 0;
        #30 B1 = 1; B2 = 0; B3 = 0; reset = 0;
        #30 B1 = 0; B2 = 1; B3 = 0; reset = 0;
        #30 B1 = 0; B2 = 1; B3 = 0; reset = 0;
        #30 B1 = 0; B2 = 0; B3 = 0; reset = 1;
        #30 B1 = 0; B2 = 0; B3 = 1; reset = 0;
        #30 B1 = 0; B2 = 0; B3 = 1; reset = 0;
    end
endmodule
