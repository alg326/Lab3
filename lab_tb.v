`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 01:51:25 PM
// Design Name: 
// Module Name: Top_adder_BCD_7_tb
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


module Top_adder_BCD_7_tb();

reg [1:0] a,b;
wire [6:0] seg;

Top_adder_BCD_7 uut(a,b,seg);

integer i;
integer j;
initial begin
    for(i=0;i<4;i=i+1)
        begin
            for(j=0;j<4;j=j+1)
            begin
                a=i;b=j;
                #10;
            end
        end
    end

endmodule
