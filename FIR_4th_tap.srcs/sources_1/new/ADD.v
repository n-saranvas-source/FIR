`timescale 1ns / 1ps
module ADD(out,a,b);
input [15:0]a,b;
output [15:0]out;

assign out=a+b;

endmodule