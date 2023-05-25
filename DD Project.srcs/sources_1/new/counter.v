//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 09:42:46 PM
// Design Name: 
// Module Name: counter
// Project Name: DD Project
// Target Devices: 
// Tool Versions: 
// Description: 
// Modulo 4 counter
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter(input clk, reset, output [1:0]count); 
reg [1:0] count;
always @(posedge clk, posedge reset) begin
 if (reset == 1)
 count <= 0; // non-blocking assignment  // initialize flip flop here
 else if (count == 3)
  count <=0;
 else
 count <= count + 1; // non-blocking assignment  // normal operation
end
endmodule

