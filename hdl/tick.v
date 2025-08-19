module tick (
    input clk, 
    input rst,
    output reg tick,
    output reg tick_blink
);
reg [25:0] count, count_next;
reg tick_blink_next;
always @(posedge clk, posedge rst) begin
    if(rst) begin
        count <= 0;
        tick_blink <= 0;
    end else begin
        count <= count_next;
        tick_blink <= tick_blink_next;
    end
end
//26'b10_1111_1010_1111_0000_1000_0000
always @(count) begin
    if(~(|(count ^ 26'b10_1111_1010_1111_0000_1000_0000))) begin
        count_next = 0;
        tick =1'b1;
    end else begin
        count_next = count + 26'd1;
        tick =1'b0;
    end
end
always @(count) begin
    if(~(|(count ^ 26'd25000000)) | ~(|(count ^ 26'b10_1111_1010_1111_0000_1000_0000))) begin
        tick_blink_next = ~tick_blink;
    end else begin
        tick_blink_next = tick_blink;
    end
end
endmodule