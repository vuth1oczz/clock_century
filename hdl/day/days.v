module days(
    input clk,
    input rst,
    input display,
    input setup_day,
    input done_hour,
    input inc_dec_day,
    input tick,
    input [5:0] curr_month,
    input [6:0] curr_year,
    output [5:0] day,
    output done_day
);
reg [5:0] days, day_next, day_target;
reg done_days, DONE_DAY;

always @(posedge clk , posedge rst) begin
    if(rst) begin
        days <= 6'd1;
       // DONE_HOUR <= 0;
    end else begin
        days <= day_next;
     //   DONE_HOUR <= done_hours;
    end
end
always @(negedge clk, posedge rst) begin
     if(rst) begin
        DONE_DAY <= 0;
    end else begin
        DONE_DAY <= done_days;
    end
end
always @(curr_month or curr_year) begin
        case(curr_month)
            6'd1,
            6'd3,
            6'd5,
            6'd7,
            6'd8,
            6'd10,
            5'd12: begin
                day_target = 6'd31;
            end
            6'd2: begin
                if(~(|(curr_year[1:0] ^ 2'b00))) begin
                    day_target = 6'd29;
                end else begin
                    day_target = 6'd28;
                end
            end
            default: day_target = 6'd30;
        endcase
   
end
always @(*) begin
    done_days = 1'b0;
    if(~display) begin
        if(done_hour) begin
            if(~(|(days ^ day_target ))) begin
                done_days = 1'b1;
                day_next = 'b0;
            end else begin
                day_next = days +1;
                done_days = 1'b0;
            end
        end else begin
            day_next = days;
        end
        if((~(|(curr_month ^ 6'd2))) & (curr_year[1:0] == 2'b00)) begin
                day_next = 6'd29;
        end else begin
                day_next = day;
        end
        if(~(|(curr_month ^ 6'd2)) & ~(curr_year[1:0] == 2'b00 )) begin
                day_next = 6'd28;
        end else begin
                day_next = day;
        end
    end else begin
        if(~setup_day) begin
            if(tick) begin
                if(~(|(days ^ (day_target+1) ))) begin
                    day_next = 6'b1;
                end else begin
                    if(inc_dec_day) begin
                        if(~(|(days ^ day_target ))) begin
                            day_next =  6'd1;
                            done_days = 1'b0;
                        end else begin
                            day_next = days + 6'd1;
                            done_days = 1'b0;
                        end
                       
                end else begin
                         if(~(|(days ^ 6'd1 ))) begin
                            day_next =  day_target;
                            done_days = 1'b0;
                        end else begin
                            day_next = days - 6'd1;
                            done_days = 1'b0;
                        end
                end
                    
                end
        end else begin
                day_next = days;
        end
        end else begin
                day_next = days;
        end
    end
end
assign done_day = DONE_DAY;
assign day = days;
endmodule