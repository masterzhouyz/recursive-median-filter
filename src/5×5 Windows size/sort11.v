`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/20 10:33:59
// Design Name: 
// Module Name: sort11
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


module sort11(
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
    output  reg [7:0] mid_select
    );
 
wire [9:0] cmp [0:9];
wire [7:0] pix [0:10];
wire  lut_out [0:9];
wire [3:0] order [0:9];

assign pix[0] = pix1;
assign pix[1] = pix2;
assign pix[2] = pix3;
assign pix[3] = pix4;
assign pix[4] = pix5;
assign pix[5] = pix6;
assign pix[6] = pix7;
assign pix[7] = pix8;
assign pix[8] = pix9;
assign pix[9] = pix10;
assign pix[10] = pix11;

genvar i,j;
generate
        for(i=0;i<10;i=i+1)
        begin:l1
            for(j=0;j<i;j=j+1)
            begin:l2
                assign cmp[i][j] = ~cmp[j][i-1];
            end
            for(j=i;j<10;j=j+1)
            begin:l3
                assign cmp[i][j] = pix[i] > pix[j+1]? 1'b1:1'b0;
            end
        end
        for(i=0;i<10;i=i+1)
        begin:l4
            sum uu(
                .in(cmp[i]),
                .num_1(order[i])
                );
        end
endgenerate
    
always@*
begin
    if(order[0] == 5)
        mid_select = pix[0];
    else if(order[1] == 5)
        mid_select = pix[1];
    else if(order[2] == 5)
        mid_select = pix[2];
    else if(order[3] == 5)
        mid_select = pix[3];
    else if(order[4] == 5)
        mid_select = pix[4];   
    else if(order[5] == 5)
        mid_select = pix[5];
    else if(order[6] == 5)
        mid_select = pix[6];
    else if(order[7] == 5)
        mid_select = pix[7];
    else if(order[8] == 5)
        mid_select = pix[8];
    else if(order[9] == 5)
        mid_select = pix[9];   
    else 
        mid_select = pix[10];
end

endmodule

module sum(
input [9:0] in,
output wire [3:0] num_1
);

assign num_1 = (in[0] & 1'b1) + (in[1] & 1'b1) + (in[2] & 1'b1) + (in[3] & 1'b1) + (in[4] & 1'b1) + (in[5] & 1'b1) + (in[6] & 1'b1) + (in[7] & 1'b1) + (in[8] & 1'b1)
            + (in[9] & 1'b1);

endmodule