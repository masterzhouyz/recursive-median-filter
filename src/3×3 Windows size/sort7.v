`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/18 19:33:46
// Design Name: 
// Module Name: sort7
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


module sort7(
input wire [7:0] pix1,
input wire [7:0] pix2,
input wire [7:0] pix3,
input wire [7:0] pix4,
input wire [7:0] pix5,
input wire [7:0] pix6,
input wire [7:0] pix7,
output reg [7:0] mid_select
    );
 
wire [5:0] cmp [0:5];
wire [7:0] pix [0:6];
wire  lut_out [0:5];

assign pix[0] = pix1;
assign pix[1] = pix2;
assign pix[2] = pix3;
assign pix[3] = pix4;
assign pix[4] = pix5;
assign pix[5] = pix6;
assign pix[6] = pix7;

genvar i,j;
generate
        for(i=0;i<6;i=i+1)
        begin:l1
            for(j=0;j<i;j=j+1)
            begin:l2
                assign cmp[i][j] = ~cmp[j][i-1];
            end
            for(j=i;j<6;j=j+1)
            begin:l3
                assign cmp[i][j] = pix[i] > pix[j+1]? 1'b1:1'b0;
            end
        end
        for(i=0;i<6;i=i+1)
        begin:l3
               LUT6 #(
                .INIT(64'b0000000100010110000101100110100000010110011010000110100010000000)
                )LUT6_instfor3(
                .O(lut_out[i]),
                .I0(cmp[i][0]),
                .I1(cmp[i][1]),
                .I2(cmp[i][2]),
                .I3(cmp[i][3]),
                .I4(cmp[i][4]),
                .I5(cmp[i][5])
                );
        end
endgenerate

always@*
begin
    if(lut_out[0])
        mid_select = pix[0];
    else if(lut_out[1])
        mid_select = pix[1];
    else if(lut_out[2])
        mid_select = pix[2];
    else if(lut_out[3])
        mid_select = pix[3];
    else if(lut_out[4])
        mid_select = pix[4];
    else if(lut_out[5])
        mid_select = pix[5];
    else 
        mid_select = pix[6];
end

endmodule
