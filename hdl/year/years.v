module years(
    input clk,
    input rst,
    input display,
    input setup_year,
    input inc_dec_year,
    input tick,
    input done_month,
    output [6:0] year,
    output done_year
);
reg [6:0] years, year_next;
reg done_years, DONE_YEAR;

always @(posedge clk , posedge rst) begin
    if(rst) begin
        years <= 7'd25;
       // DONE_HOUR <= 0;
    end else begin
        years <= year_next;
     //   DONE_HOUR <= done_hours;
    end
end
always @(negedge clk, posedge rst) begin
     if(rst) begin
        DONE_YEAR <= 0;
    end else begin
        DONE_YEAR <= done_years;
    end
end

always @(*) begin
    done_years = 1'b0;
    if(~display) begin
        if(done_month) begin
            if(~(|(years ^ 7'd99 ))) begin
                done_years = 1'b1;
                year_next = 7'd25;
            end else begin
                    year_next = years + 7'd1;
                    done_years = 1'b0;
            end
        end else begin
            year_next = years;
        end

    end else begin
        if(~setup_year) begin
            if(tick) begin
                if(~(|(years ^ 7'd99 ))) begin
                    year_next = 7'd25;
                end else begin
                    if(inc_dec_year) begin
                        year_next = years + 7'd1;
                        done_years = 1'b0;
                    end else begin
                        year_next = years - 7'd1;
                        done_years = 1'b0;
                    end
                end
        end else begin
                year_next = years;
        end
        end else begin
                year_next = years;
        end
    end
end
assign year = years;
assign done_year = DONE_YEAR;
endmodule