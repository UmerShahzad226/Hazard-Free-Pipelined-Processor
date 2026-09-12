`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2025 10:48:47 PM
// Design Name: 
// Module Name: tb_ForwardingUnit
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
module tb_ForwardingUnit;

logic [4:0] ID_EX_rs1;
logic [4:0] ID_EX_rs2;
logic [4:0] EX_MEM_rd;
logic [4:0] MEM_WB_rd;
logic EX_MEM_regWrite;
logic MEM_WB_regWrite;

logic [1:0] forwardA;
logic [1:0] forwardB;

ForwardingUnit dut (
    .ID_EX_rs1(ID_EX_rs1),
    .ID_EX_rs2(ID_EX_rs2),
    .EX_MEM_rd(EX_MEM_rd),
    .MEM_WB_rd(MEM_WB_rd),
    .EX_MEM_regWrite(EX_MEM_regWrite),
    .MEM_WB_regWrite(MEM_WB_regWrite),
    .forwardA(forwardA),
    .forwardB(forwardB)
);

initial begin

    ID_EX_rs1 = 0;
    ID_EX_rs2 = 0;
    EX_MEM_rd = 0;
    MEM_WB_rd = 0;
    EX_MEM_regWrite = 0;
    MEM_WB_regWrite = 0;

    #10;

    EX_MEM_regWrite = 1;
    EX_MEM_rd = 5;
    ID_EX_rs1 = 5;
    ID_EX_rs2 = 3;
    #10;

    EX_MEM_rd = 7;
    ID_EX_rs1 = 1;
    ID_EX_rs2 = 7;
    #10;

    EX_MEM_regWrite = 0;
    MEM_WB_regWrite = 1;
    MEM_WB_rd = 4;
    ID_EX_rs1 = 4;
    ID_EX_rs2 = 2;
    #10;

    MEM_WB_rd = 9;
    ID_EX_rs1 = 3;
    ID_EX_rs2 = 9;
    #10;

    EX_MEM_regWrite = 1;
    EX_MEM_rd = 6;
    MEM_WB_regWrite = 1;
    MEM_WB_rd = 6;
    ID_EX_rs1 = 6;
    ID_EX_rs2 = 6;
    #10;

    EX_MEM_rd = 0;
    MEM_WB_rd = 0;
    ID_EX_rs1 = 0;
    ID_EX_rs2 = 0;
    #10;

    $finish;
end

initial begin
    $monitor("T=%0t rs1=%0d rs2=%0d EX_rd=%0d MEM_rd=%0d | fA=%b fB=%b",
              $time, ID_EX_rs1, ID_EX_rs2,
              EX_MEM_rd, MEM_WB_rd,
              forwardA, forwardB);
end


endmodule
