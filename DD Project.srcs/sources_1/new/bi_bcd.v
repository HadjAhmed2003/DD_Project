//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 09:27:01 PM
// Design Name: 
// Module Name: bi_bcd
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


module bi_bcd(
    units,tenth,hundredth,thousandth,thousdandth2,seg,an,clk, rst, sl, sr, som, eom, isNegative
    );
    input [3:0] units,tenth,hundredth,thousandth,thousdandth2;
    input clk, rst, sl, sr,som, eom,isNegative;
    output [6:0] seg;
    output [3:0] an; 
    wire [3:0] first,second,third;
    reg [3:0] digit; 
    wire [1:0] count; 
    wire clk_out; 
    clockDivider #(500000) clkdiv(clk, rst, clk_out);
    shifter shift(units,tenth,hundredth,thousandth,thousdandth2,first,second,third,clk_out,rst,sl, sr, som);
    counter cnt(clk_out,rst,count);
    SevenSegDec decoder(digit, count, seg, an);
    always@(*)begin
        case(count)
        0:  digit=first;
        1:  digit=second;
        2:  digit=third;
        3:  digit=(isNegative)?4'b1010 : 4'b1111;
        endcase
      end
endmodule