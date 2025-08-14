module months(
    input clk,
    input rst,
    input display,
    input setup_month,
    input inc_dec_month,
    input done_day,
    input tick,
    output [5:0] month,
    output done_month
);
reg [5:0] months, month_next;
reg done_months, DONE_MONTH;

always @(posedge clk , posedge rst) begin
    if(rst) begin
        months <= 6'd1;
       // DONE_HOUR <= 0;
    end else begin
        months <= month_next;
     //   DONE_HOUR <= done_hours;
    end
end
always @(negedge clk, posedge rst) begin
     if(rst) begin
        DONE_MONTH <= 0;
    end else begin
        DONE_MONTH <= done_months;
    end
end

always @(*) begin
    done_months = 1'b0;
    if(~display) begin
        if(done_day) begin
            if(~(|(months ^ 6'd12 ))) begin
                done_months = 1'b1;
                month_next  = 6'd1;
            end else begin
                if(inc_dec_month) begin
                    month_next = months + 6'd1;
                    done_months = 1'b0;
                end else begin
                    month_next = months - 6'd1;
                    done_months = 1'b0;
                end

            end
        end else begin
            month_next = months;
        end

    end else begin
        if(~setup_month) begin
            if(tick) begin
                if(~(|(months ^ 6'd13 ))) begin
                    month_next = 6'd1;
                end else begin
                    if(inc_dec_month) begin
                        if(~(|(months ^ 6'd12 ))) begin
                            month_next = 6'd1;
                            done_months = 1'b0;
                        end else begin
                            month_next = months + 6'd1;
                            done_months = 1'b0;
                        end
                        
                    end else begin
                        if(~(|(months ^ 6'd1 ))) begin
                            month_next = 6'd12;
                            done_months = 1'b0;
                        end else begin
                            month_next = months - 6'd1;
                            done_months = 1'b0;
                        end
                    end
                end
        end else begin
                month_next = months;
        end
        end else begin
                month_next = months;
        end
    end
end
assign month = months;
assign done_month = DONE_MONTH;
endmodule