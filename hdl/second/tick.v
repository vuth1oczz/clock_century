module tick (
    input clk, 
    input rst,
    output reg tick
);
reg [25:0] count, count_next;

always @(posedge clk, posedge rst) begin
    if(rst) begin
        count <= 0;
        
    end else begin
        count <= count_next;
    end
end
always @(*) begin
    if(~(|(count ^ 26'b10_1111_1010_1111_0000_1000_0000))) begin
        count_next = 0;
        tick =1'b1;
    end else begin
        count_next = count + 26'd1;
        tick =1'b0;
    end
end

endmodule