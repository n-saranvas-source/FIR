`timescale 1ns / 1ps
module pipo2(out,data_in,ld,clk);

input [15:0] data_in;
input ld,clk;
output reg [15:0]out;

always@(posedge clk)
begin
if(ld)
out <= data_in;
end

endmodule
