//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 08:43:36 PM
// Design Name: 
// Module Name: unsignedMutiply
// Project Name: DD Project
// Target Devices: 
// Tool Versions: 
// Description: 
// This module is responsible for calculating the unsigned multiplication of two numbers.
// It receives as input the clock and reset and start of multiplication (som) signals as well as the multiplier and the multiplicand and it generates as output the product
// of the multiplication and an end of multiplication (eom) signal. If the reset signal is active, then all registers and variables are reset to their initial values. 
// If the som signal is active, the multiplication process is initiated. The multiplicand register and multiplier register are loaded with the values of multiplicand and 
// multiplier respectively. The product is set to 0, and eom is set to 0 to indicate that the multiplication is in progress. If the multiplier register is not zero, 
// the multiplication process continues. If the least significant bit of multiplier register is 1, indicating a non-zero value, 
// the product is updated by adding the multiplicand register value to it. Then, both the multiplicand register and multiplier register are shifted right and left respectively by 1 bit.
// If the multiplier register is zero, it means that the multiplication process is complete.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module unsignedMultiply(
    clk, rst, multiplier, multiplicand, product, som, eom 
    ); 
    input clk, rst, som; //som indicate start of multiplication and eom indicate end of multiplication
    input [7:0] multiplier; 
    input [7:0] multiplicand;
    output reg [15:0] product; 
    output reg eom; //reg because used in the always block
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