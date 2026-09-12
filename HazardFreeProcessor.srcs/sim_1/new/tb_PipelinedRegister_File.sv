`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2025 10:35:37 PM
// Design Name: 
// Module Name: tb_PipelinedRegister_File
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
module tb_PipelinedRegister_File;

parameter WIDTH = 32;

logic clk;
logic reset;
logic enable;
logic flush;
logic [WIDTH-1:0] in;
logic [WIDTH-1:0] out;

PipelinedRegister_File #(WIDTH) dut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .flush(flush),
    .in(in),
    .out(out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    enable = 0;
    flush = 0;
    in = 0;

    #10;
    reset = 0;

    enable = 1;
    in = 32'hA5A5A5A5;
    #10;

    in = 32'h12345678;
    #10;

    flush = 1;
    #10;
    flush = 0;

    in = 32'hFFFFFFFF;
    #10;

    enable = 0;
    in = 32'h00000000;
    #10;

    enable = 1;
    in = 32'hDEADBEEF;
    #10;

    $finish;
end

initial begin
    $monitor("T=%0t reset=%b enable=%b flush=%b in=%h out=%h",
             $time, reset, enable, flush, in, out);
end


endmodule