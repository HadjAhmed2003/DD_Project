//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 08:43:36 PM
// Design Name: 
// Module Name: UM
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


module UM(
    clk, rst, multiplier, multiplicand, product, som, eom
    );
    input clk, rst, som; 
    input [7:0] multiplier; 
    input [7:0] multiplicand;
    output reg [15:0] product; 
    output reg eom; 
    reg [7:0] multiplier_register;
    reg [15:0] multiplicand_register; 
    always @(posedge clk or posedge rst)begin
        if(rst)begin
            multiplicand_register <=0;
            multiplier_register <= 0;
            product<= 0;
            eom = 0; 
        end
        else begin
            if(som)begin
                multiplicand_register <= multiplicand;
                multiplier_register <= multiplier;
                product <= 0;
                eom = 0; 
            end
            else if(multiplier_register != 0)begin
                eom = 0;
                if(multiplier_register[0]==1)begin
                    product <= product + multiplicand_register; 
                    multiplicand_register <= multiplicand_register << 1; 
                    multiplier_register <= multiplier_register >> 1;
                end
                else begin 
                    product <= product;
                    multiplicand_register <= multiplicand_register << 1; 
                    multiplier_register <= multiplier_register >> 1;
                end
            end
            else begin
                product <= product; 
                eom = 1; 
            end
        end
    end
endmodule