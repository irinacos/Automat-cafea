`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2023 09:12:43 AM
// Design Name: 
// Module Name: automat_cafea
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


module automat_cafea(
    input B1,B2,B3,clk,reset,
    output reg cafea,rest
    );
    
reg [2:0]state;
reg [2:0]next_state;

always @(posedge clk)
    if(reset)
        begin
        state<=3'b000;
        cafea<=2'b00; // o cafea costa 3 lei
        rest<=2'b00;
        end
     else
        state<=next_state;

always @(state or B1 or B2 or B3)
    // B1 | B2 | B3 | state
    case({B1, B2, B3, state})
        // daca B1 = 1 si starea curenta e 0, am bagat 1 leu, deci starea o setez pe 1
        6'b100000:
            begin
                next_state=3'b001;
                cafea=2'b00;
                rest=2'b00;
            end
       // daca B2 = 1 si starea curenta e 0, am bagat 2 lei, deci starea o setez pe 2
       6'b010000:
            begin
                next_state=3'b010;
                cafea=2'b00;
                rest=2'b00;
            end
       // daca B3 = 1 si starea curenta e 0, starea = 3 lei
       6'b001000:
            begin
                next_state=3'b011;
                cafea=2'b01;
                rest=2'b00;
            end
            
            
       6'b100001:
            begin
                next_state=3'b010;
                cafea=2'b00;
                rest=2'b00;
            end
       6'b010001:
            begin
                next_state=3'b011;
                cafea=2'b01;
                rest=2'b00;
            end
       // am 1 leu si mai bag 3 lei
       6'b001001:
            begin
                next_state=3'b100;
                cafea=2'b01;
                rest=2'b01;
            end
            
            
       6'b100010:
            begin
                next_state=3'b011;
                cafea=2'b01;
                rest=2'b00;
            end
       6'b010010:
            begin
                next_state=3'b100;
                cafea=2'b01;
                rest=2'b01;
            end
       6'b001010:
            begin
                next_state=3'b101;
                cafea=2'b01;
                rest=2'b10;
            end
            
        
        // 4 lei
        6'b100011:
            begin
                next_state=3'b100;
                cafea=2'b01;
                rest=2'b01;
            end
        // 5 lei
        6'b010011:
            begin
                next_state=3'b101;
                cafea=2'b01;
                rest=2'b10;
            end
        // 6 lei
        6'b001011:
            begin
                next_state=3'b110;
                cafea=2'b10;
                rest=2'b00;
            end
       default:
            begin
                next_state=3'b000; 
                cafea=0;
                rest=0;
            end
      endcase
endmodule
