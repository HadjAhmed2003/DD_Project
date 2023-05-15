//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 09:47:07 PM
// Design Name: 
// Module Name: SevenSegDec
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


module SevenSegDec( 
    input [3:0] digit, input [1:0] count,
    output reg [6:0] seg, output reg [3:0]an);
    always @ (digit) begin
        case(digit)
            0: seg = 7'b0000001;
            1: seg = 7'b1001111;
            2: seg = 7'b0010010;
            3: seg = 7'b0000110;
            4: seg = 7'b1001100;
            5: seg = 7'b0100100;
            6: seg = 7'b0100000;
            7: seg = 7'b0001111;
            8: seg = 7'b0000000;
            9: seg = 7'b0000100;
            10: seg = 7'b11111110;
            default: seg = 7'b11111111; 
            endcase
        end
     always@(*)begin
        case(count)
        0:  an=4'b1110;
        1:  an=4'b1101;
        2:  an=4'b1011;
        3:  an=4'b0111;
        endcase
        end
     
endmodule
