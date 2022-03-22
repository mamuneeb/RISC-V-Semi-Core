`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2022 21:25:14
// Design Name: 
// Module Name: Memory
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


module Memory(
    input clk,
    input [31:0] PC,
    input rd,
    input wr,
    input [31:0] inputdata,
    output reg [31:0] outputdata
    
    );
    reg [31:0] memory [15:0];
    
    always@(posedge clk) begin
        if (wr) begin
            memory[PC] <= inputdata;
        end      
        if (rd) begin
            outputdata <= memory[PC];
        end 
    end
    
endmodule
