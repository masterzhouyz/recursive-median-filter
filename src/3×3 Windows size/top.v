`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/18 19:41:57
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
input wire clk,
input wire [7:0] pix1,
input wire [7:0] pix2,
input wire [7:0] pix3,
input wire [7:0] pix4,
input wire [7:0] pix5,
input wire [7:0] pix6,
input wire [7:0] pix7,
input wire [7:0] pix8,
input wire [7:0] pix9,
output  [7:0] mid_select
    );

reg [7:0] Mid1;
reg [7:0] Mid2;
reg [7:0] Mid3;
reg [7:0] Mid_reg;

wire [7:0] mid1;
wire [7:0] mid2;
wire [7:0] mid3;
wire [7:0] mid4;

always@(posedge clk)
begin
    Mid1 <= mid1;
    Mid2 <= mid2;
    Mid3 <= mid3;
    Mid_reg <= mid_select;
end

select5_3 u1(
    .pix1(pix4),
    .pix2(pix9),
    .pix3(pix6),
    .pix4(pix7),
    .pix5(pix8),

    .mid1(mid1),
    .mid2(mid2),
    .mid3(mid3)
    );
   
sort7 u2(
    .pix1(Mid1),
    .pix2(Mid2),
    .pix3(Mid3),
    .pix4(Mid_reg),
    .pix5(pix7),
    .pix6(pix8),
    .pix7(pix9),
    .mid_select(mid_select)
    );

endmodule
