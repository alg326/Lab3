`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 01:42:35 PM
// Design Name: 
// Module Name: lab_3
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


module Top_adder_BCD_7 (a,b,seg);
    input [1:0] a,b;
    output [6:0] seg;
    
    wire cout_w;
    wire [1:0] s_w;
    wire [3:0] bcd_w;
    
    assign bcd_w = {1'b0, cout_w, s_w};
    
    Top_2bit uut1(a,b,cout_w,s_w);
    
    BCD_7 uut2(bcd_w, seg);
    
    endmodule
    
module Top_2bit (a,b,cout,s);
    input[1:0] a,b;
    output cout;
    output [1:0] s;
    wire cin_0;
    
    wire c;
    
    assign cin_0 = 1'b0;
    
    FA A1 (a[0],b[0],cin_0,c,s[0]);
    
    FA A2 (a[1],b[1],c,cout,s[1]);
    
    endmodule
    
module FA(a,b,c_in,c_out,s);
    input a,b,c_in;
    output c_out,s;
    
    assign s=a^b^c_in;
    assign c_out=(b&c_in)|(a&c_in)|(a&b);
    
    endmodule
    
module BCD_7(bcd, SEG);
    input [3:0] bcd;
    output reg [6:0] SEG;
    
    always @(bcd)
    begin
        case(bcd)
            0 : SEG = 7'b1000000;
            1 : SEG = 7'b1111001;
            2 : SEG = 7'b0100100;
            3 : SEG = 7'b0110000;
            4 : SEG = 7'b0011001;
            5 : SEG = 7'b0010010;
            6 : SEG = 7'b0000010;
            default : SEG = 7'bxxxxxxx;
        endcase
    end
 endmodule 
