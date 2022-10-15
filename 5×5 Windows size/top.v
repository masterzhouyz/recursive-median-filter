`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/20 14:43:19
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input wire [7:0] pix1,
    input wire [7:0] pix2,
    input wire [7:0] pix3,
    input wire [7:0] pix4,
    input wire [7:0] pix5,
    input wire [7:0] pix6,
    input wire [7:0] pix7,
    input wire [7:0] pix8,
    input wire [7:0] pix9,
    input wire [7:0] pix10,
    input wire [7:0] pix11,
    input wire [7:0] pix12,
    input wire [7:0] pix13,
    input wire [7:0] pix14,
    input wire [7:0] pix15,
    input wire [7:0] pix16,
    input wire [7:0] pix17,
    input wire [7:0] pix18,
    input wire [7:0] pix19,
    input wire [7:0] pix20,
    input wire [7:0] pix21,
    input wire [7:0] pix22,
    input wire [7:0] pix23,
    input wire [7:0] pix24,
    input wire [7:0] pix25,
    output  [7:0] mid_select
    );
    
reg [7:0] Mid1;
reg [7:0] Mid2;
reg [7:0] Mid3;
reg [7:0] Mid4;
reg [7:0] Mid5;
reg [7:0] mid_reg;
//reg [7:0] pix21_reg[0:1];
//reg [7:0] pix22_reg[0:1];
//reg [7:0] pix23_reg[0:1];
//reg [7:0] pix24_reg[0:1];
//reg [7:0] pix25_reg[0:1];

wire [7:0] mid1;
wire [7:0] mid2;
wire [7:0] mid3;
wire [7:0] mid4;
wire [7:0] mid5;

always@(posedge clk)
begin
    Mid1 <= mid1;
    Mid2 <= mid2;
    Mid3 <= mid3;
    Mid4 <= mid4;
    Mid5 <= mid5;
    mid_reg <= mid_select;
end

//always@(posedge clk)
//begin
//    pix21_reg[0] <= pix21;
//    pix21_reg[1] <= pix21_reg[0];
//    pix22_reg[0] <= pix22;
//    pix22_reg[1] <= pix22_reg[0];
//    pix23_reg[0] <= pix23;
//    pix23_reg[1] <= pix23_reg[0];
//    pix24_reg[0] <= pix24;
//    pix24_reg[1] <= pix24_reg[0];
//    pix25_reg[0] <= pix25;
//    pix25_reg[1] <= pix25_reg[0];
//end

select20_6 m1(
    .clk(clk),
    .pix1(pix6),
    .pix2(pix7),
    .pix3(pix8),
    .pix4(pix9),
    .pix5(pix10),
    .pix6(pix11),
    .pix7(pix12),
    .pix8(pix13),
    .pix9(pix14),
    .pix10(pix15),
    .pix11(pix16),
    .pix12(pix17),
    .pix13(pix18),
    .pix14(pix19),
    .pix15(pix20),
    .pix16(pix21),
    .pix17(pix22),
    .pix18(pix23),
    .pix19(pix24),
    .pix20(pix25),
    .mid1(mid1),
    .mid2(mid2),
    .mid3(mid3),
    .mid4(mid4),
    .mid5(mid5)
    );
   
sort11 m2(
    .clk(clk),
    .pix1(Mid1),
    .pix2(Mid2),
    .pix3(Mid3),
    .pix4(Mid4),
    .pix5(Mid5),
    .pix6(mid_reg),
    .pix7(pix21),
    .pix8(pix22),
    .pix9(pix23),
    .pix10(pix24),
    .pix11(pix25),
    .mid_select(mid_select)
    );
    
endmodule
