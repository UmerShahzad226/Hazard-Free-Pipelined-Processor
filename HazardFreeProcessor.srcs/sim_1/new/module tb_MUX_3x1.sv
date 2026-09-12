`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2025 11:26:29 PM
// Design Name: 
// Module Name: module tb_MUX_3x1
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
module tb_MUX_3x1;

parameter WIDTH = 32;

logic [WIDTH-1:0] a0;
logic [WIDTH-1:0] a1;
logic [WIDTH-1:0] a2;
logic [1:0] sel;
logic [WIDTH-1:0] y;

MUX_3x1 #(WIDTH) dut (
    .a0(a0),
    .a1(a1),
    .a2(a2),
    .sel(sel),
    .y(y)
);

initial begin
    a0 = 32'hAAAA_AAAA;
    a1 = 32'h5555_5555;
    a2 = 32'hDEAD_BEEF;

    sel = 2'b00;
    #10;

    sel = 2'b01;
    #10;

    sel = 2'b10;
    #10;

    sel = 2'b11;
    #10;

    $finish;
end

initial begin
    $monitor("T=%0t sel=%b | a0=%h a1=%h a2=%h => y=%h",
              $time, sel, a0, a1, a2, y);
end


endmodule
