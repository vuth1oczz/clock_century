module bcd_encode
#(
    parameter N = 8 
)
(
  
    input  [N-1:0]  decimal,
    output  [3:0] unit,
    output  [3:0] tens
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

end
assign unit = temp7[N+3-1:N-1];
assign tens = temp7[N+7-1:N+4-1];


endmodule