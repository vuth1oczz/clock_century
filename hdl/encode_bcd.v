module encode_bcd
#(
    parameter N = 8 
)
(
  
    input  [N-1:0]  decimal,
    output  [3:0] unit,
    output  [3:0] tens,
    output  [3:0] hund,
    output  [3:0] thousand,
    output nhuan_
);

reg [15+N:0] temp;
reg [15+N:0] temp1;
reg [15+N:0] temp2;
reg [15+N:0] temp3;
reg [15+N:0] temp4;
reg [15+N:0] temp5;
reg [15+N:0] temp6;
reg [15+N:0] temp7;
reg [15+N:0] temp8;
reg [15+N:0] temp9;
reg [15+N:0] temp10;
reg [15+N:0] temp11;
reg [15+N:0] temp12;
reg [15+N:0] temp13;
reg [15+N:0] temp14;
reg [15+N:0] temp15;
reg [15+N:0] temp16;
always @(decimal)begin
    temp = {16'b0, decimal};

    temp1 = temp << 1;
    temp2 = temp1 << 1;
    temp3 = temp2 << 1;
    temp3[N+3:N] = (temp3[N+3:N] >= 5)? (temp3[N+3:N] + 4'b0011) : temp3[N+3:N];
    temp4 = temp3 << 1;
    temp4[N+3:N] = (temp4[N+3:N] >= 5)? (temp4[N+3:N] + 4'b0011) : temp4[N+3:N];


    temp5 = temp4 << 1;
    temp5[N+3:N] = (temp5[N+3:N] >= 5)? (temp5[N+3:N] + 4'b0011) : temp5[N+3:N];
    temp6 = temp5 << 1;
    temp6[N+3:N] = (temp6[N+3:N] >= 5)? (temp6[N+3:N] + 4'b0011) : temp6[N+3:N];
    temp6[N+7:N+4] = (temp6[N+7:N+4] >= 5)? (temp6[N+7:N+4] + 4'b0011) : temp6[N+7:N+4];
    temp7 = temp6 << 1;
    temp7[N+3:N] = (temp7[N+3:N] >= 5)? (temp7[N+3:N] + 4'b0011) : temp7[N+3:N];
    temp7[N+7:N+4] = (temp7[N+7:N+4] >= 5)? (temp7[N+7:N+4] + 4'b0011) : temp7[N+7:N+4];
    temp8 = temp7 << 1;
    temp8[N+3:N] = (temp8[N+3:N] >= 5)? (temp8[N+3:N] + 4'b0011) : temp8[N+3:N];
    temp8[N+7:N+4] = (temp8[N+7:N+4] >= 5)? (temp8[N+7:N+4] + 4'b0011) : temp8[N+7:N+4];
    temp8[N+11:N+8] = (temp8[N+11:N+8] >= 5)? (temp8[N+11:N+8] + 4'b0011) : temp8[N+11:N+8];

    temp9 = temp8 << 1;
    temp9[N+3:N] = (temp9[N+3:N] >= 5)? (temp9[N+3:N] + 4'b0011) : temp9[N+3:N];
    temp9[N+7:N+4] = (temp9[N+7:N+4] >= 5)? (temp9[N+7:N+4] + 4'b0011) : temp9[N+7:N+4];
    temp9[N+11:N+8] = (temp9[N+11:N+8] >= 5)? (temp9[N+11:N+8] + 4'b0011) : temp9[N+11:N+8];
    temp10 = temp9 << 1;
    temp10[N+3:N] = (temp10[N+3:N] >= 5)? (temp10[N+3:N] + 4'b0011) : temp10[N+3:N];
    temp10[N+7:N+4] = (temp10[N+7:N+4] >= 5)? (temp10[N+7:N+4] + 4'b0011) : temp10[N+7:N+4];
    temp10[N+11:N+8] = (temp10[N+11:N+8] >= 5)? (temp10[N+11:N+8] + 4'b0011) : temp10[N+11:N+8];
    temp11 = temp10 << 1;
    temp11[N+3:N] = (temp11[N+3:N] >= 5)? (temp11[N+3:N] + 4'b0011) : temp11[N+3:N];
    temp11[N+7:N+4] = (temp11[N+7:N+4] >= 5)? (temp11[N+7:N+4] + 4'b0011) : temp11[N+7:N+4];
    temp11[N+11:N+8] = (temp11[N+11:N+8] >= 5)? (temp11[N+11:N+8] + 4'b0011) : temp11[N+11:N+8];
    temp11[N+15:N+12] = (temp8[N+15:N+12] >= 5)? (temp8[N+15:N+12] + 4'b0011) : temp8[N+15:N+12];
    temp12 = temp11 << 1;
    temp12[N+3:N] = (temp12[N+3:N] >= 5)? (temp12[N+3:N] + 4'b0011) : temp12[N+3:N];
    temp12[N+7:N+4] = (temp12[N+7:N+4] >= 5)? (temp12[N+7:N+4] + 4'b0011) : temp12[N+7:N+4];
    temp12[N+11:N+8] = (temp12[N+11:N+8] >= 5)? (temp12[N+11:N+8] + 4'b0011) : temp12[N+11:N+8];
    temp12[N+15:N+12] = (temp12[N+15:N+12] >= 5)? (temp12[N+15:N+12] + 4'b0011) : temp12[N+15:N+12];

    temp13 = temp12 << 1;
    temp13[N+3:N] = (temp13[N+3:N] >= 5)? (temp13[N+3:N] + 4'b0011) : temp13[N+3:N];
    temp13[N+7:N+4] = (temp13[N+7:N+4] >= 5)? (temp13[N+7:N+4] + 4'b0011) : temp13[N+7:N+4];
    temp13[N+11:N+8] = (temp13[N+11:N+8] >= 5)? (temp13[N+11:N+8] + 4'b0011) : temp13[N+11:N+8];
    temp13[N+15:N+12] = (temp13[N+15:N+12] >= 5)? (temp13[N+15:N+12] + 4'b0011) : temp13[N+15:N+12];

    temp14 = temp13 << 1;
    temp14[N+3:N] = (temp14[N+3:N] >= 5)? (temp14[N+3:N] + 4'b0011) : temp14[N+3:N];
    temp14[N+7:N+4] = (temp14[N+7:N+4] >= 5)? (temp14[N+7:N+4] + 4'b0011) : temp14[N+7:N+4];
    temp14[N+11:N+8] = (temp14[N+11:N+8] >= 5)? (temp14[N+11:N+8] + 4'b0011) : temp14[N+11:N+8];
    temp14[N+15:N+12] = (temp14[N+15:N+12] >= 5)? (temp14[N+15:N+12] + 4'b0011) : temp14[N+15:N+12];

    temp15 = temp14 << 1;
    temp15[N+3:N] = (temp15[N+3:N] >= 5)? (temp15[N+3:N] + 4'b0011) : temp15[N+3:N];
    temp15[N+7:N+4] = (temp15[N+7:N+4] >= 5)? (temp15[N+7:N+4] + 4'b0011) : temp15[N+7:N+4];
    temp15[N+11:N+8] = (temp15[N+11:N+8] >= 5)? (temp15[N+11:N+8] + 4'b0011) : temp15[N+11:N+8];
    temp15[N+15:N+12] = (temp15[N+15:N+12] >= 5)? (temp15[N+15:N+12] + 4'b0011) : temp15[N+15:N+12];

    temp16 = temp15 << 1;
    temp16[N+3:N] = (temp16[N+3:N] >= 5)? (temp16[N+3:N] + 4'b0011) : temp16[N+3:N];
    temp16[N+7:N+4] = (temp16[N+7:N+4] >= 5)? (temp16[N+7:N+4] + 4'b0011) : temp16[N+7:N+4];
    temp16[N+11:N+8] = (temp16[N+11:N+8] >= 5)? (temp16[N+11:N+8] + 4'b0011) : temp16[N+11:N+8];
    temp16[N+15:N+12] = (temp16[N+15:N+12] >= 5)? (temp16[N+15:N+12] + 4'b0011) : temp16[N+15:N+12];
end
assign unit = temp15[N+3-1:N-1];
assign tens = temp15[N+7-1:N+4-1];
assign hund = temp15[N+11-1:N+8-1];
assign thousand = temp15[N+15-1:N+12-1];
reg nhuan;
always @(unit or tens or hund or thousand or decimal) begin
    if((decimal[1:0] == 2'b0)) begin
        if((unit == 4'd0 ) & (tens == 4'd0)) begin
                if(decimal[3:0] == 3'b0) begin
                    nhuan = 1'b1;
                end else begin
                    nhuan =1'b0;
                end
        end else begin
            nhuan = 1'b1;
        end
    end else begin
        nhuan =1'b0;
    end
end
assign nhuan_ = nhuan;
endmodule