`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2022 19:17:18
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] In1,
    input [31:0] In2,
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [31:0] Result
    );
   
    `define add   17'b00000000000110011
    `define sub   17'b01000000000110011
    `define sll   17'b00000000010110011
    `define slt   17'b00000000100110011
    `define sltu  17'b00000000110110011
    `define xor   17'b00000001000110011
    `define srl   17'b00000001010110011
    `define sra   17'b01000001010110011
    `define or    17'b00000001100110011
    `define and   17'b00000001110110011
    
        always@(*)
  begin
   case({funct7,funct3,opcode})
   //// add Instruction ////
   `add : begin
           Result = In1 + In2;
          end 
   `sub : begin 
           Result = In1 - In2;
          end
   `sll : begin
           Result = In1 << In2;
          end
   `slt : begin
           Result = (In1 < In2) ? 1 : 0;
          end
   `sltu : begin
           Result = (In1 < In2) ? 1 : 0;
          end 
   `xor : begin
           Result = In1 ^ In2;
          end 
    `srl : begin
           Result = In1 >> In2;
          end
    `sra : begin
           Result = In1 >> In2;
          end
    `or : begin
           Result = In1 | In2;
          end 
    `and : begin
           Result = In1 & In2;
           end                                          
   endcase
  end
     
    
endmodule
