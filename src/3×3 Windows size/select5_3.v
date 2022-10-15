`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/17 15:17:26
// Design Name: 
// Module Name: select7_3
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


module select5_3(
    input wire [7:0] pix1,
    input wire [7:0] pix2,
    input wire [7:0] pix3,
    input wire [7:0] pix4,
    input wire [7:0] pix5,
    output reg [7:0] mid1,
    output reg [7:0] mid2,
    output reg [7:0] mid3
    );

wire [3:0] cmp [0:4];
wire [7:0] pix [0:4];
wire  lut_out [0:4];
wire  [1:0] index [0:3];

assign pix[0] = pix1;
assign pix[1] = pix2;
assign pix[2] = pix3;
assign pix[3] = pix4;
assign pix[4] = pix5;


genvar i,j,k;
generate
        for(i=0;i<5;i=i+1)
        begin:l1
            for(j=0;j<i;j=j+1)
            begin:l2
                assign cmp[i][j] = ~cmp[j][i-1];
            end
            for(j=i;j<4;j=j+1)
            begin:l3
                assign cmp[i][j] = pix[i] > pix[j+1]? 1'b1:1'b0;
            end
        end
        for(k=0;k<5;k=k + 1)  
        begin:l4
             LUT4 #(
                .INIT(16'b0111111111111110)
                   ) LUT_inst(
                    .O(lut_out[k]),
                    .I0(cmp[k][0]),
                    .I1(cmp[k][1]),
                    .I2(cmp[k][2]),
                    .I3(cmp[k][3])
                    );
        end
        assign index[0] = lut_out[0];
        for(i=1;i<5;i=i+1)
        begin:l5
            assign index[i] = index[i-1] + lut_out[i];
        end
endgenerate

always@*
begin
    if(index[0])
        mid1 = pix[0];
    else if(index[1])
        mid1 = pix[1];
    else
        mid1 = pix[2];  
end

always@*
begin
    if(index[1][1])
        mid2 = pix[1];
    else if(index[2][1])
        mid2 = pix[2];
    else
        mid2 = pix[3];
 end
 
 always@*
 begin
    if(index[2][1] && index[2][0] )
        mid3 = pix[2];
    else if(index[3][1] && index[3][0] )
        mid3 = pix[3];
    else
        mid3 = pix[4];
 end
 
endmodule
