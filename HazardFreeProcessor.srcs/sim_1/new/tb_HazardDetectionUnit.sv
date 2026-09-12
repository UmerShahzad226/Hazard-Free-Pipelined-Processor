`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2025 10:45:02 PM
// Design Name: 
// Module Name: tb_HazardDetectionUnit
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
module tb_HazardDetectionUnit;

logic ID_EX_memread;
logic [4:0] ID_EX_rd;
logic [4:0] IF_ID_rs1;
logic [4:0] IF_ID_rs2;

logic PCWrite;
logic IF_ID_Write;
logic ID_EX_Flush;

HazardDetectionUnit dut (
    .ID_EX_memread(ID_EX_memread),
    .ID_EX_rd(ID_EX_rd),
    .IF_ID_rs1(IF_ID_rs1),
    .IF_ID_rs2(IF_ID_rs2),
    .PCWrite(PCWrite),
    .IF_ID_Write(IF_ID_Write),
    .ID_EX_Flush(ID_EX_Flush)
);

initial begin

    ID_EX_memread = 0;
    ID_EX_rd = 0;
    IF_ID_rs1 = 0;
    IF_ID_rs2 = 0;

    #10;

    ID_EX_memread = 1;
    ID_EX_rd = 5;
    IF_ID_rs1 = 5;
    IF_ID_rs2 = 3;
    #10;

    ID_EX_memread = 1;
    ID_EX_rd = 8;
    IF_ID_rs1 = 2;
    IF_ID_rs2 = 8;
    #10;

    ID_EX_memread = 1;
    ID_EX_rd = 0;
    IF_ID_rs1 = 0;
    IF_ID_rs2 = 1;
    #10;

    ID_EX_memread = 0;
    ID_EX_rd = 10;
    IF_ID_rs1 = 10;
    IF_ID_rs2 = 10;
    #10;

    $finish;
end

initial begin
    $monitor("T=%0t memread=%b rd=%0d rs1=%0d rs2=%0d | PCWrite=%b IF_ID_Write=%b Flush=%b",
              $time, ID_EX_memread, ID_EX_rd, IF_ID_rs1, IF_ID_rs2,
              PCWrite, IF_ID_Write, ID_EX_Flush);
end


endmodule
