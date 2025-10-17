`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2024 12:54:59
// Design Name: 
// Module Name: fir_tb3
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
module fir_tb5();
reg start,clk,rst;
reg [7:0]data_in;

wire y_ld,D_ld,D_mov,D_sft,done,clr;
wire [15:0]y;

fir_datapath UUT_DATAPATH (
        .y(y),
        .y_ld(y_ld),
        .D_ld(D_ld),
        .D_mov(D_mov),
        .D_sft(D_sft),
        .clr(clr),
        .data_in(data_in),
        .clk(clk)
    );
    
    fir_controller UUT_CONTROLLER (
        .y_ld(y_ld),
        .D_ld(D_ld),
        .D_mov(D_mov),
        .D_sft(D_sft),
        .clr(clr),
        .clk(clk),
        .rst(rst),
        .start(start),
        .done(done)
    );
    always #5 clk=~clk;
    
    initial begin
    clk = 0;
        rst = 0;
        start = 0;
        data_in = 8'b0;
        
        rst=1;
        #20;
        rst=0;
        
        start=1;
        #10;
        start=0;
        
         #10;
        data_in = 8'd10;
        #20;
        #60;
        
        
        data_in = 8'd5; 
        #20;
        #60;
        
        data_in = 8'd3; 
        #20
        #60;
        
        data_in = 8'd8; 
        #20;
        #60;
        
        data_in = 8'd9; 
        #20;
        #60;
        
        data_in = 8'd13; 
        #20;
        #60;
        
        data_in = 8'd7; 
        #20;
        #60;
        
        data_in = 8'd2; 
        #20;
        #60;
        
        data_in = 8'd11; 
        #20;
        #60;
        
        data_in = 8'd8; 
        #20;
        #60;
   
        $display("FIR Filter Output: %d", y);
        
        #3000 $finish;
    end
    
    
endmodule

