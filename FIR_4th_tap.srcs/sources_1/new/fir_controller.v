`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2024 12:30:58
// Design Name: 
// Module Name: fir_controller
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


`timescale 1ns / 1ps
module fir_controller(y_ld,D_ld,D_mov,D_sft,clr,clk,rst,start,done);
input clk,rst,start;
output reg y_ld,D_ld,D_mov,D_sft,done,clr;

parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
//s0=idle;s1=loadstate;s2=computestate;s3=writestate;s4=shiftstate;
reg [2:0] current_state,next_state;
 always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= s0;
        else
            current_state <= next_state;
    end
always@(posedge clk)
case(current_state)
s0: if(start)next_state<=s1;
s1: next_state<=s2;
s2:  next_state<=s3;
s3: next_state<=s4;
s4: next_state<=s1;
default: next_state<=s0;
endcase

always@(current_state)
case(current_state)
s0: begin y_ld<=0;D_ld<=0;D_mov<=0;D_sft=0;done<=0;clr<=1; end
s1: begin y_ld<=0;D_ld<=1;D_mov<=0;D_sft=0;done<=0;clr<=0; end
s2: begin y_ld<=0;D_ld<=0;D_mov<=0;D_sft=0;done<=0;clr<=0; end

s3: begin y_ld<=1;D_ld<=0;D_mov<=0;D_sft=1;done<=1;clr<=0; end
s4: begin y_ld<=0;D_ld<=0;D_mov<=1;D_sft=0;done<=0;clr<=0; end
default: begin y_ld<=0;D_ld<=0;D_mov<=0;D_sft=0;done<=0;clr=1; end
endcase

endmodule