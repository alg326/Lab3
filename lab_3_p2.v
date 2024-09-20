`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 02:30:57 PM
// Design Name: 
// Module Name: lab_3_p2
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

module Top_adder_BCD_7 (a,b,w_c0,seg);
    input [1:0] a,b;
    input w_c0;
    output [6:0] seg;
    
    wire cout_w;
    wire [1:0] s_w;
    wire [3:0] bcd_w;
    
    assign bcd_w = {1'b0, cout_w, s_w};
    
    Top_2bit uut1(a,b,cout_w,w_c0,s_w);
    
    BCD_7 uut2(bcd_w, seg);
    
    endmodule
    
module Top_2bit (a,b,cout,w_c0,s);
    input[1:0] a,b;
    input w_c0;
    output cout;
    output [1:0] s;
    
    wire [2:0]w_c;
    wire [1:0]w_g,w_p,w_s;
    
    assign w_g[0]=a[0]&b[0];
    assign w_g[1]=a[1]&b[1];
    
    assign w_p[0]=a[0]^b[0];
    assign w_p[1]=a[1]^b[1];
    
    assign w_c[0]=w_c0;
    assign w_c[1]=w_g[0]|w_p[0]&w_c[0];
    assign w_c[2]=w_g[1]|w_p[1]&w_c[1];
    
    FA A1 (a[0],b[0],w_c[0],s[0]);
    
    FA A2 (a[1],b[1],w_c[1],s[1]);
    
    assign cout=w_c[2];
    
    endmodule
    
module FA(a,b,c_in,s);
    input a,b,c_in;
    output s;
    
    assign s=a^b^c_in;
    
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
