//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 08:39:22 PM
// Design Name: 
// Module Name: synchronizer
// Project Name: DD Project
// Target Devices: 
// Tool Versions: 
// Description: 
// The synchronizer synchronizes the input signal to the clock domain and its output represents the synchronized version of the input signal.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module synchronizer(
input clk, sig, rst, output reg sig1 
    );
reg q1;
always @ (posedge clk,posedge rst) begin 
    if(rst)begin
    q1 <= 0;
    sig1 <= 0;
    end 
    else begin
    q1 <= sig; 
    sig1 <= q1; 
    end
end 
endmodule
