//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 09:30:26 PM
// Design Name: 
// Module Name: binary_to_digits
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


module binary_to_digits(
    product,units,tenth,hundredth,thousandth,thousdandth2
    );
    input [15:0] product; 
    output [3:0] units,tenth,hundredth,thousandth,thousdandth2;
    reg [19:0] temp;
    integer i;
            
    always @(product) begin
        temp=0;		 	
        for (i=0;i<16;i=i+1) begin
           if (temp[3:0] >= 5) temp[3:0] = temp[3:0] + 3;
           if (temp[7:4] >= 5) temp[7:4] = temp[7:4] + 3;
           if (temp[11:8] >= 5) temp[11:8] = temp[11:8] + 3;
           if (temp[15:12] >= 5) temp[15:12] = temp[15:12] + 3;
           if (temp[19:16] >= 5) temp[19:16] = temp[19:16] + 3;
           temp = {temp[18:0],product[15-i]};
         end                             
     end
        
     assign units = temp[3:0];
     assign tenth = temp[7:4];
     assign hundredth = temp[11:8];
     assign thousandth = temp[15:12];
     assign thousdandth2 = temp[19:16];
endmodule
