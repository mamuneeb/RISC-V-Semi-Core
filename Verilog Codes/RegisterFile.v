`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2022 19:16:26
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input clk,
    input [31:0] Data_in,
    input [4:0] Wr_idx,
    input En,
    input [4:0] R1_idx,
    input [4:0] R2_idx,
    output [31:0] Reg_1,
    output [31:0] Reg_2    
    );
    reg [31:0] GPR [15:0];
    // integer i;
    initial 
    begin
     GPR[1] = 32'd1;
     GPR[2] = 32'd2;
     GPR[3] = 32'd3;
     end
    
    assign Reg_1 = GPR[R1_idx];
    assign Reg_2 = GPR[R2_idx];
    //assign GPR[Wr_idx] <= Data_in;
    always @(negedge clk)
    begin
     GPR[Wr_idx] <= Data_in;
    end
endmodule
