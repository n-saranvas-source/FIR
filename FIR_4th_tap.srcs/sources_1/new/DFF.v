`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2024 13:02:25
// Design Name: 
// Module Name: DFF
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



module DFF(q,d,D_mov,clr,clk);

input [7:0]d;
input clk,clr,D_mov;
output reg[7:0]q;

always@(posedge clk)
if(clr)
q<=0;
else if(D_mov) 
q<=d;

endmodule

