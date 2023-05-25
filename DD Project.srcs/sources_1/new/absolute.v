`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 09:12:54 PM
// Design Name: 
// Module Name: absolute
// Project Name: DD Project
// Target Devices: 
// Tool Versions: 
// Description: 
// This is a basic module that calculates the absolute value of two 8-bit numbers. If the reset signal is active, the sign variable is set to 0, ensuring a predictable initial
// state. If the som signal is active, indicating the multiplication has started, the sign variable is determined by the XOR operation between the most significant bit of the 
// multiplier and the most significant bit of the multiplicand. This calculates whether the two numbers have the same sign or different signs. If neither the reset nor the som is
// active, the sign variable is not updated.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module absolute(
    clk, rst, a, b, outa, outb, sign, som
    );
    input clk, rst
    input som; //som indicates start of multiplication
    input [7:0] a, b; 
    output [7:0] outa, outb; 
    output reg sign; // sign of the product
    
    assign outa = (a[7] == 1)? ~(a)+1 : a; //Two's complementor
    assign outb = (b[7] == 1)? ~(b)+1 : b; //Two's complementor
    always @ (posedge clk, posedge rst)begin
        if(rst) sign = 0; 
        else if(som) sign = a[7] ^ b[7]; //Product sign is -ve only if the multiplier and multiplicand signs are different
        else sign = sign; 
    end 
endmodule
