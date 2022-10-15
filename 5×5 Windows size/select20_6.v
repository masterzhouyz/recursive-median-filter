`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/19 18:50:28
// Design Name: 
// Module Name: select20_6
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


module select20_6(
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
    output reg [7:0] mid1,
    output reg [7:0] mid2,
    output reg [7:0] mid3,
    output reg [7:0] mid4,
    output reg [7:0] mid5
    );
    
wire [17:0] cmp [0:17];
wire [7:0] pix [0:18];
wire  lut_out [0:18];
wire [4:0] order [0:18];
wire  [3:0] index [0:18];
reg [17:0] cmp_reg[0:18];
reg [4:0] order_reg[0:18];
reg [7:0] pix_reg1[0:18];
reg [7:0] pix_reg2[0:18];

assign pix[0] = pix1;
assign pix[1] = pix2;
assign pix[2] = pix3;
assign pix[3] = pix4;
assign pix[4] = pix5;
assign pix[5] = pix6;
assign pix[6] = pix7;
assign pix[7] = pix9;
assign pix[8] = pix10;
assign pix[9] = pix11;
assign pix[10] = pix12;
assign pix[11] = pix13;
assign pix[12] = pix14;
assign pix[13] = pix15;
assign pix[14] = pix16;
assign pix[15] = pix17;
assign pix[16] = pix18;
assign pix[17] = pix19;
assign pix[18] = pix20;
//assign pix[19] = pix20;

genvar i,j;
generate
        for(i=0;i<18;i=i+1)
        begin:l1
            for(j=0;j<i;j=j+1)
            begin:l2
                assign cmp[i][j] = ~cmp[j][i-1];
            end
            for(j=i;j<18;j=j+1)
            begin:l3
                assign cmp[i][j] = pix[i] > pix[j+1]? 1'b1:1'b0;
            end
        end
        for(i=0;i<18;i=i+1)
        begin:l4
            sum1 u(
                .in(cmp[i]),
                .num_1(order[i])
                );
        end
endgenerate

always@(*)
begin
    if(order[0] == 7)
        mid1 = pix[0];
    else if(order[1] == 7)
        mid1 = pix[1];
    else if(order[2] == 7)
        mid1 = pix[2];
    else if(order[3] == 7)
        mid1 = pix[3];
    else if(order[4] == 7)
        mid1 = pix[4];   
    else if(order[5] == 7)
        mid1 = pix[5];
    else if(order[6] == 7)
        mid1 = pix[6];
    else if(order[7] == 7)
        mid1 = pix[7];
    else if(order[8] == 7)
        mid1 = pix[8];
    else if(order[9] == 7)
        mid1 = pix[9];   
    else if(order[10] == 7)
        mid1 = pix[10];
    else if(order[11] == 7)
        mid1 = pix[11];
    else if(order[12] == 7)
        mid1 = pix[12];
    else if(order[13] == 7)
        mid1 = pix[13];
    else if(order[14] == 7)
        mid1 = pix[14];   
    else if(order[15] == 7)
        mid1 = pix[15];
    else if(order[16] == 7)
        mid1 = pix[16];
    else if(order[17] == 7)
        mid1 = pix[17];
    else
        mid1 = pix[18];
end

always@(*)
begin
    if(order[0] == 8)
        mid2 = pix[0];
    else if(order[1] == 8)
        mid2 = pix[1];
    else if(order[2] == 8)
        mid2 = pix[2];
    else if(order[3] == 8)
        mid2 = pix[3];
    else if(order[4] == 8)
        mid2 = pix[4];   
    else if(order[5] == 8)
        mid2 = pix[5];
    else if(order[6] == 8)
        mid2 = pix[6];
    else if(order[7] == 8)
        mid2 = pix[7];
    else if(order[8] == 8)
        mid2 = pix[8];
    else if(order[9] == 8)
        mid2 = pix[9];   
    else if(order[10] == 8)
        mid2 = pix[10];
    else if(order[11] == 8)
        mid2 = pix[11];
    else if(order[12] == 8)
        mid2 = pix[12];
    else if(order[13] == 8)
        mid2 = pix[13];
    else if(order[14] == 8)
        mid2 = pix[14];   
    else if(order[15] == 8)
        mid2 = pix[15];
    else if(order[16] == 8)
        mid2 = pix[16];
    else if(order[17] == 8)
        mid2 = pix[17];
    else 
        mid2 = pix[18];
end

always@(*)
begin
    if(order[0] == 9)
        mid3 = pix[0];
    else if(order[1] == 9)
        mid3 = pix[1];
    else if(order[2] == 9)
        mid3 = pix[2];
    else if(order[3] == 9)
        mid3 = pix[3];
    else if(order[4] == 9)
        mid3 = pix[4];   
    else if(order[5] == 9)
        mid3 = pix[5];
    else if(order[6] == 9)
        mid3 = pix[6];
    else if(order[7] == 9)
        mid3 = pix[7];
    else if(order[8] == 9)
        mid3 = pix[8];
    else if(order[9] == 9)
        mid3 = pix[9];   
    else if(order[10] == 9)
        mid3 = pix[10];
    else if(order[11] == 9)
        mid3 = pix[11];
    else if(order[12] == 9)
        mid3 = pix[12];
    else if(order[13] == 9)
        mid3 = pix[13];
    else if(order[14] == 9)
        mid3 = pix[14];   
    else if(order[15] == 9)
        mid3 = pix[15];
    else if(order[16] == 9)
        mid3 = pix[16];
    else if(order[17] == 9)
        mid3 = pix[17];
    else
        mid3 = pix[18];
end

always@(*)
begin
    if(order[0] == 10)
        mid4 = pix[0];
    else if(order[1] == 10)
        mid4 = pix[1];
    else if(order[2] == 10)
        mid4 = pix[2];
    else if(order[3] == 10)
        mid4 = pix[3];
    else if(order[4] == 10)
        mid4 = pix[4];   
    else if(order[5] == 10)
        mid4 = pix[5];
    else if(order[6] == 10)
        mid4 = pix[6];
    else if(order[7] == 10)
        mid4 = pix[7];
    else if(order[8] == 10)
        mid4 = pix[8];
    else if(order[9] == 10)
        mid4 = pix[9];   
    else if(order[10] == 10)
        mid4 = pix[10];
    else if(order[11] == 10)
        mid4 = pix[11];
    else if(order[12] == 10)
        mid4 = pix[12];
    else if(order[13] == 10)
        mid4 = pix[13];
    else if(order[14] == 10)
        mid4 = pix[14];   
    else if(order[15] == 10)
        mid4 = pix[15];
    else if(order[16] == 10)
        mid4 = pix[16];
    else if(order[17] == 10)
        mid4 = pix[17];
    else 
        mid4 = pix[18];
end


always@(*)
begin
    if(order[0] == 11)
        mid5 = pix[0];
    else if(order[1] == 11)
        mid5 = pix[1];
    else if(order[2] == 11)
        mid5 = pix[2];
    else if(order[3] == 11)
        mid5 = pix[3];
    else if(order[4] == 11)
        mid5 = pix[4];   
    else if(order[5] == 11)
        mid5 = pix[5];
    else if(order[6] == 11)
        mid5 = pix[6];
    else if(order[7] == 11)
        mid5 = pix[7];
    else if(order[8] == 11)
        mid5 = pix[8];
    else if(order[9] == 11)
        mid5 = pix[9];   
    else if(order[10] == 11)
        mid5 = pix[10];
    else if(order[11] == 11)
        mid5 = pix[11];
    else if(order[12] == 11)
        mid5 = pix[12];
    else if(order[13] == 11)
        mid5 = pix[13];
    else if(order[14] == 11)
        mid5 = pix[14];   
    else if(order[15] == 11)
        mid5 = pix[15];
    else if(order[16] == 11)
        mid5 = pix[16];
    else if(order[17] == 11)
        mid5 = pix[17];
    else
        mid5 = pix[18];
end

endmodule

module sum1(
input [17:0] in,
output wire [4:0] num_1
);

assign num_1 = (in[0] & 1'b1) + (in[1] & 1'b1) + (in[2] & 1'b1) + (in[3] & 1'b1) + (in[4] & 1'b1) + (in[5] & 1'b1) + (in[6] & 1'b1) + (in[7] & 1'b1) + (in[8] & 1'b1)
            + (in[9] & 1'b1) + (in[10] & 1'b1) + (in[11] & 1'b1)+ (in[12] & 1'b1) + (in[13] & 1'b1) + (in[14] & 1'b1) + (in[15] & 1'b1) + (in[16] & 1'b1)
            + (in[17] & 1'b1);

endmodule