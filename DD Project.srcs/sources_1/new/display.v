//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 09:27:01 PM
// Design Name: 
// Module Name: display
// Project Name: DD Project
// Target Devices: 
// Tool Versions: 
// Description: 
// The display module combines the scroller and the SevenSegDec module to display the final result. It stores in
// wires “first”, “second”, and “third” the three digits that should be outputted to the seven segment display. 
// It also takes as an input the product sign. Using these four values it can instantiate the SevenSegDec module 
// and pass to it a digit value. Then using the fast counter implemented previously it can change the digit value 
// at a pace coordinated with the same pace at which the anode active value changes in the SevenSegDec module 
// implementation such that it will output the three digits as well as the product sign at the same time
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module display(
    clk, rst, units,tenth,hundredth,thousandth,thousdandth2,seg,an,sl, sr, som, eom, isNegative
    );
    input clk, rst;
    input [3:0] units,tenth,hundredth,thousandth,thousdandth2;
    input sl, sr,som, eom,isNegative; //sl=scroll left, sr=scroll right, som=start of multiplication, eom=end of multiplication, isNegative=the sign of the product
    output [6:0] seg; //7 segment display values
    output [3:0] an; //Anode active
    wire [3:0] first,second,third;
    reg [3:0] digit; 
    wire [1:0] count; //The fast counter to change digit value 
    wire clk_out; 
    clockDivider #(500000) clkdiv(.clk(clk), .rst(rst), .clk_out(clk_out));
    scroller scroll(.clk(clk_out),.rst(rst),.units(units),.tenth(tenth),.hundredth(hundredth),.thousandth(thousandth),.thousdandth2(thousdandth2),.first(first),.second(second),.third(third),.sl(sl), .sr(sr), .som(som)); //scrolling
    counter cnt(.clk(clk_out),.reset(rst),.count(count));
    SevenSegDec decoder(.digit(digit), .count(count), .seg(seg), .an(an));
    always@(*)begin
        case(count)
        0:  digit=first;
        1:  digit=second;
        2:  digit=third;
        3:  digit=(isNegative)?4'b1010 : 4'b1111;
        endcase
      end
endmodule