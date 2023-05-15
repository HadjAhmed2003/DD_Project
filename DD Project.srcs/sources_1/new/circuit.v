//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 08:58:17 PM
// Design Name: 
// Module Name: circuit
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


module circuit(
    clk, rst, multiplier, multiplicand, seg, an, btnc, eom, btnl, btnr
    );
    input clk, rst, btnc, btnl, btnr; 
    input [7:0]multiplier, multiplicand; 
    output [6:0] seg;
    output [3:0] an; 
    output eom;
    wire som, s1, sr, isNegative; 
    wire [7:0] abs_multiplier, abs_multiplicand;
    wire [15:0] product; 
    wire [3:0] units,tenth,hundredth,thousandth,thousdandth2;
    button start(btnc, clk, rst, som);
    button shift_left(btnl, clk, rst, sl);
    button shift_right(btnr, clk, rst, sr);
    absolute abs(multiplier, multiplicand, abs_multiplier, abs_multiplicand, isNegative);
    UM multiply(clk, rst, abs_multiplier, abs_multiplicand, product, som, eom);
    binary_to_digits btd(product,units,tenth,hundredth,thousandth,thousdandth2);
    bi_bcd bcd(units,tenth,hundredth,thousandth,thousdandth2,seg,an,clk,rst,sl,sr,som,isNegative);
endmodule
