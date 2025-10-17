`timescale 1ns / 1ps
module pipo(out,data_in,ld,clk);

input [7:0] data_in;
input ld,clk;
output reg [7:0]out;

always@(posedge clk)
begin
if(ld)
out <= data_in;
end

endmodule