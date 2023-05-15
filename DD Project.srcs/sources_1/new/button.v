`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 08:35:04 PM
// Design Name: 
// Module Name: button
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


module button(
input a, clk, rst, output out
    );
    wire w2;
    wire w1;
    wire clk_out; 
    clockDivider #(500000) clkdiv(clk, rst, clk_out);
    debouncer deb (clk_out, rst, a, w1);
    synchronizer synch(clk_out, w1, rst, w2); 
    edge_detector dete(clk_out, rst, w2, out);
endmodule