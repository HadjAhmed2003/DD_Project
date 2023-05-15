//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2023 08:41:08 PM
// Design Name: 
// Module Name: edge_detector
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


module edge_detector(input clk, rst, w, output z);
  reg [1:0] state, nextState;
  parameter [1:0] A=2'b00, B=2'b01, C=2'b10; // States Encoding
  // Next state generation (combinational logic)
 // Next state generation (combinational logic)
  always @ (posedge clk, posedge rst) begin
    if (rst) begin
        state <= A;
    end
    else begin
    case (state)
      A: if (w==0) state <= A;
         else state <= B;
      B: if (w==0) state <= A;
         else state <= C;
      C: if (w==0) state <= A;
         else state <= C;
      default: state <= A;
    endcase
    end
  end
  assign z = (state == B);

endmodule
