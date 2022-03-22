`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2022 21:31:22
// Design Name: 
// Module Name: RV32E
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

`include "ALU.v"
`include "Decoder.v"
`include "Memory.v"
`include "RegisterFile.v"
module RV32E(
        input clk,
        //input reset,
        //input wire [31:0] indata,
        //output reg [31:0] outdata,
        //output reg [31:0] outmemaddr,
       // output reg mem_wr,        
       // output reg mem_rd,
        input [31:0] INSTR,
       output reg [31:0] ALUResult
    );
    
    reg [31:0] PC;
    reg [31:0] instr  ;
    
    wire [4:0] rd;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [6:0] opcode;
    wire WriteBackEn;
        
    Decoder MyDecoder(
                 .instr(instr),
                 .rd(rd),
                 .WriteBackEn(WriteBackEn),
                 .rs1(rs1),
                 .rs2(rs2),
                 .funct3(funct3),
                 .funct7(funct7),
                 .opcode(opcode)
                 );
                 
    //// Register File ////
    reg [31:0] Data_in ;
    wire [31:0] Regdata1;
    wire [31:0] Regdata2;
    
     RegisterFile MyRegFile(
                 .clk(clk),
                 .Data_in(Data_in),
                 .Wr_idx(rd),
                 .En(WriteBackEn),
                 .R1_idx(rs1),
                 .R2_idx(rs2),
                 .Reg_1(Regdata1),
                 .Reg_2(Regdata2)
                 );
                 
    //// ALU ////
    
   // reg [31:0] ALUin1;
   wire [31:0] aluout;
    reg [31:0] aluIn1;
    reg [31:0] aluIn2;
    ALU MyALU(
             .In1(aluIn1),
             .In2(aluIn2),
             .opcode(opcode),
             .funct3(funct3),
             .funct7(funct7),
             .Result(aluout)
              );
             
           
        //// State Machine ////
       reg [2:0] state = 3'b000;
       parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011 ;
       
    always @(posedge clk) 
    begin
        case(state)
        s0    :      begin
                     instr <= INSTR;
                     #5;
                     state <= s1;
                     end
       s1     :      begin
                     aluIn1 <= Regdata1;
	                 aluIn2 <= Regdata2;
	                 #5;
                     state <= s2;
                     end 
       s2     :      begin
                     ALUResult <= aluout;
                     Data_in <= aluout;
                     #5;
                     state <= s3;
                     end
         endcase
         end                                                                     
endmodule


















