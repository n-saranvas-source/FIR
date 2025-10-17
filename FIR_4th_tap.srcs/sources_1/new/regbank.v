`timescale 1ns / 1ps
module reg_bank_shift(clk,rst,load,data_in,reg0,reg1,reg2);

    input clk;           // Clock signal
    input rst;           // Reset signal (active high)
    input load;         // Load signal to trigger shifting
    input [7:0] data_in;  // 8-bit input data
    output [7:0] reg0;    // Output of register 0 (bottom-most register)
    output [7:0] reg1;    // Output of register 1
    output [7:0] reg2;    // Output of register 2
    //output [7:0] reg3; 

    reg [7:0] r0, r1, r2; // 8-bit registers
    
    // Shift logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // On reset, clear all the registers
            r0 <= 8'b0;
            r1 <= 8'b0;
            r2 <= 8'b0;
           // r3 <= 8'b0;
        end else if (load) begin
            // Shift data from top-most to bottom-most register
            r0 <= r1;   // r0 gets the value of r1
            r1 <= r2;   // r1 gets the value of r2
            r2 <= data_in;   // r2 gets the value of r3
            //r3 <= data_in; // r3 (top-most register) gets the input data
        end
    end

    // Assign outputs to the register values
    assign reg0 = r0;
    assign reg1 = r1;
    assign reg2 = r2;
    //assign reg3 = r3;

endmodule