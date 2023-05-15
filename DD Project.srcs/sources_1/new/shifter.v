//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 09:59:16 PM
// Design Name: 
// Module Name: shifter
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


module shifter(
    units,tenth,hundredth,thousandth,thousdandth2,first,second,third,clk,rst,sl, sr , som
    );
    input [3:0] units,tenth,hundredth,thousandth,thousdandth2;
    output reg [3:0] first,second,third;
    input clk,rst,sl, sr, som;
    reg [1:0] sel;
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
        
    always @ (*) begin
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
endmodule
