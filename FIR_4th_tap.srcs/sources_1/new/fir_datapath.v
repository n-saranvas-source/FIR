`timescale 1ns / 1ps
module fir_datapath(y,y_ld,D_ld,D_mov,D_sft,clr,data_in,clk);
output [15:0]y;
input y_ld,D_ld,D_mov,D_sft,clr,clk;
input [7:0] data_in;

wire [7:0] a,b,c,e,d;
wire [15:0] xout,yout,zout,wout,uout,vout,Aout,Bout,Cout,Dout;

parameter [7:0] w0=8'd2,w1=8'd2,w2=8'd2,w3=8'd2,w4=8'd2;



pipo Xn(a,data_in,D_ld,clk);
//DFF Xn1(b,a,D_mov,clr,clk);
//DFF Xn2(c,b,D_sft,clr,clk);
//DFF Xn3(d,c,D_sft,clr,clk);
//DFF Xn4(e,d,D_sft,clr,clk);
DFF Xn1(b,a,D_mov,clr,clk);
reg_bank_shift Xn2(clk,clr,D_mov,b,e,d,c);

multi one(xout,a,w0);
multi two(uout,b,w1);
multi three(zout,c,w2);
multi four(wout,d,w3);
multi five(vout,e,w4);

ADD adder0(Aout,xout,uout);
ADD adder1(Bout,Aout,zout);
ADD adder2(Cout,Bout,wout);
ADD adder3(Dout,Cout,vout);
pipo2 Yn(y,Dout,y_ld,clk);

endmodule

