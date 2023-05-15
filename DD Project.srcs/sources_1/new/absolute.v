`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 09:12:54 PM
// Design Name: 
// Module Name: absolute
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


module absolute(
    a, b, outa, outb, sign
    );
    input [7:0] a, b; 
    output [7:0] outa, outb; 
    output sign; 
    assign outa = (a[7] == 1)? ~(a)+1 : a; 
    assign outb = (b[7] == 1)? ~(b)+1 : b; 
    assign sign = a[7] ^ b[7];
endmodule