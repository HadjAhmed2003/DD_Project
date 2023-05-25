//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 08:58:17 PM
// Design Name: 
// Module Name: circuit
// Project Name: DD Project
// Target Devices: 
// Tool Versions: 
// Description: 
// This is the top module which executes the entire circuit. The module takes as input the clock and reset signals as well as three inputs btnc, btnl and btnr representing the
// 3 buttons. It also takes as input two 8-bit signed variables, the multiplicand and the multiplier. The output of this module is a 7 bit array representing the 7 segment display 
// and a 4 bit array for the anode signals as well as an output signal eom representing end of multiplication as explained above. The circuit initiates the process by instantiating 
// the module Button firstly when the user presses on the start button (BTNC) on the FPGA. This triggers the start of the multiplication. The circuit module also instantiates 2 other
// instances of the button module; one for when the user presses on the BTNL button on the FPGA for the scrolling left and one for when the user presses on the BTNC button on the FPGA 
// for the scrolling right. The circuit module also instantiates the module Absolute which returns the absolute of the multiplicand & the multiplier while keeping track of the output sign. 
// Moreover, the circuit module instantiates the UM (Unsigned Multiplier) module and passes to it the absolute multiplicand & the absolute multiplier to conduct unsigned multiplication. 
// The circuit module also instantiates the module Binary_to_Digits to convert the product into Binary Coded Decimal and it also instantiates the module Bi_BCD which is responsible for the 
// final output on the FPGA. Accordingly, one can see that this circuit module is the main module controllin// g the flow of the circuit.
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
    button start(.clk(clk),.rst(rst),.a(btnc),.out(som));
    button scroll_left(.clk(clk), .rst(rst),.a(btnl),.out(sl));
    button scroll_right(.clk(clk), .rst(rst),.a(btnr),.out(sr));
    absolute abs(.clk(clk), .rst(rst),.a(multiplier), .b(multiplicand), .outa(abs_multiplier), .outb(abs_multiplicand), .sign(isNegative),.som(som));
    unsignedMultiply multiply(.clk(clk), .rst(rst), .multiplier(abs_multiplier), .multiplicand(abs_multiplicand), .product(product), .som(som), .eom(eom));
    binary_to_BCD btd(.product(product),.units(units),.tenth(tenth),.hundredth(hundredth),.thousandth(thousandth),.thousdandth2(thousdandth2));
    display myDisplay(.units(units),.tenth(tenth),.hundredth(hundredth),.thousandth(thousandth),.thousdandth2(thousdandth2),.seg(seg),.an(an),.clk(clk),.rst(rst),.sl(sl),.sr(sr),.som(som),.eom(eom),.isNegative(isNegative));
endmodule