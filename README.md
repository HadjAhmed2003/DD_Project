# DD_Project
A signed multiplier developped using verilog for Digital Design 1 Project. 
Created by: Hadj Ahmed, Thomas, Mahmoud Nour, Raafat El-Saeed 
To run this code, upload it on a Basys 3 FPGA 
Things to consider: 
- the toggle switches are used to enter two 8-bit binary signed values:
  o The Multiplier (SW7-SW0)
  o The Multiplicand (SW15-SW8)
• The right three 7-segment display digits are used to show the product in decimal.
• The most left 7-segment digit is used for the sign.
• As the product can be up to 5 decimal digits, use the push buttons: BTNL and BTNR to scroll the
product digits (right three 7-segement display digits).
• The push button BTNC is used to start the multiplication.
• The LED LD0 is used to indicate the end of multiplication.
• The button BTND is used as a reset 
