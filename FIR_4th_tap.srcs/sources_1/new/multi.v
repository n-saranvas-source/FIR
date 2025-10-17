
`timescale 1ns / 1ps
module multi(out,x,y);
output reg[15:0]out;
input [7:0]x,y;

always@(*)
out<=x*y;

endmodule
