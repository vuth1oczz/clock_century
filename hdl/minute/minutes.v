module minutes (
    input clk,
    input rst,
    input display,
    input setup_minute,
    input inc_dec_min,
    input done_sec,
    input tick,
    output [5:0] minute,
    output done_minute

);

reg [5:0] min, min_next;
reg done_min, DONE_MIN;

always @(posedge clk , posedge rst) begin
    if(rst) begin
        min <= 0;
        DONE_MIN <= 0;
    end else begin
        min <= min_next;
        DONE_MIN <= done_min;
    end
end
// always @(negedge clk, posedge rst) begin
//      if(rst) begin
//         DONE_MIN <= 0;
//     end else begin
//         DONE_MIN <= done_min;
//     end
// end
always @(*) begin
    done_min = 1'b0;
    if(~display) begin
            if(done_sec) begin
                if(~(|(min ^ 6'b11_1011))) begin
                    done_min = 1'b1;
                    min_next = 'b0;
                end else begin
                    min_next = min +6'd1;
                    done_min = 1'b0;
                end
                
            end else begin
                min_next = min;
            end
    end else begin
            if(~setup_minute) begin
                if(tick) begin
                    if(~(|(min ^ 6'b11_1100))) begin
                        //done_min = 1'b1;
                        min_next = 'b0;
                    end else begin
                        if(inc_dec_min) begin
                            if(~(|(min ^ 6'd59))) begin
                                min_next = 6'd0;
                                done_min = 1'b0;
                            end else begin
                                min_next = min +6'd1;
                                done_min = 1'b0;
                            end
                        end else begin
                            if(~(|(min ^ 6'd0))) begin
                                min_next = 6'd59;
                                done_min = 1'b0;
                            end else begin
                                min_next = min - 6'd1;
                                done_min = 1'b0;
                            end
                        end
                    end 
                end else begin
                    min_next = min;
                end 
            end else begin
                min_next = min;
            end
    end
end

assign minute = min;
assign done_minute = DONE_MIN;
endmodule