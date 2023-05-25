//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 09:59:16 PM
// Design Name: 
// Module Name: scroller
// Project Name: DD Project
// Target Devices: 
// Tool Versions: 
// Description: 
// The module scroller is, as the name implies, used for scrolling through the digits of the product. The module uses a 2 bit wire named sel to indicate which three of the
 five digits should be displayed. A value of 0 indicates that the units, tenth, and hundredth will be displayed. A value of 1 indicates that the tenth, hundredth, and thousandth
 will be displayed. A value of 2 indicates that the hundredth, thousandth, and ten thousandth will be displayed. sl (to scroll left) and sr (to scroll right) are the buttons for
 scrolling and they are two of the inputs of the module. If the scroll right button is pressed we add 1 to the value sel. If the scroll left button is pressed we subtract 1 from
 the value sel. This change eventually scrolls the digits. Note that we have a maximum value of 2 and a minimum value of 0 for the value sel. That is because after scrolling right from the most left two times, we can’t scroll anymore. Same goes for the left scrolling
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module scroller(
    clk,rst,units,tenth,hundredth,thousandth,thousdandth2,first,second,third,sl, sr , som
    );
    input clk,rst,
    input sl, sr, som;
    input [3:0] units,tenth,hundredth,thousandth,thousdandth2;
    output reg [3:0] first,second,third;
    reg [1:0] sel;
    always @ (posedge clk, posedge rst) begin
         if(rst || som)
            sel <= 0;
         else begin
            if(sl == 1 && sr == 1) begin
                sel <= sel;
            end else if(sl == 0 && sr == 0) begin
                sel <= sel;
            end else if(sl == 1 && sr == 0 && sel > 0) begin
                sel <= sel-1;
            end
            else if(sl == 0 && sr == 1 && sel < 2) begin
                sel <= sel+1;
            end 
         end 
     end  
    always @ (*) begin
            if(sel ==0 || rst == 1) begin
                first = units;
                second = tenth;
                third = hundredth;
            end else if(sel == 1) begin
                first = tenth;
                second = hundredth;
                third = thousandth;
            end else if(sel == 2) begin
                first = hundredth;
                second = thousandth;
                third = thousdandth2;
            end
        end
        
//     always @(rst, som)begin
//            sel <= 0;
//     end 
endmodule