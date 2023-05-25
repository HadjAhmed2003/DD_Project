`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 08:35:04 PM
// Design Name: 
// Module Name: button
// Project Name: DD Project
// Target Devices: 
// Tool Versions: 
// Description: 
// This is a basic module responsible for generating output signals based on the input which is the click of a button on the FPGA be it the start of the multiplication through 
// clicking on BTNC or shifting left or right through BTNL or BTNR. In this module, we instantiate a clock divider, a debouncer, a synchronizer and an edge detector module. 
// The button module is the one coordinating the functionality of the modules instantiated inside it to handle input debouncing and ensure reliable signal detection.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module button(
input clk, rst, a, output out
    );
    wire w2;
    wire w1;
    wire clk_out; 
    clockDivider #(500000) clkdiv(.clk(clk), .rst(rst), .clk_out(clk_out));
    debouncer deb (.clk(clk_out), .rst(rst), .in(a), .out(w1));
    synchronizer synch(.clk(clk_out),.sig(w1), .rst(rst), .sig1(w2)); 
    edge_detector dete(.clk(clk_out), .rst(rst), .w(w2), .z(out));
endmodule