module control_unit(
    input clk, 
    input rst,
    input display,
    input swap_display,
    input blink_tick,
    input setup_second_day,
    input setup_minute_month,
    input setup_hour_year,
    output blink_sec_day,
    output blink_min_month,
    output blink_hour_year

);
reg BLINK_SEC_DAY, BLINK_MIN_MONTH, BLINK_HOUR_YEAR;
reg [2:0] cs, ns;
localparam DISPLAY =  3'b000 ;
localparam SETUP =     3'b001;
localparam SETUP_SEC = 3'b010;
localparam SETUP_MIN = 3'b011;
localparam SETUP_HOUR = 3'b100;
always @(posedge clk, posedge rst) begin
    if(rst) begin
        cs <= DISPLAY;
    end else begin
        cs <= ns;
    end
end
always @(*) begin
    BLINK_HOUR_YEAR = 0;
    BLINK_MIN_MONTH = 0;
    BLINK_SEC_DAY = 0;
    case(cs) 
        DISPLAY: begin
            if(display ) ns = SETUP;
            else ns = DISPLAY;
        end
        SETUP: begin
            BLINK_HOUR_YEAR = 0;
            BLINK_MIN_MONTH = 0;
            BLINK_SEC_DAY = 0;
            if(~setup_second_day) begin
                if(blink_tick) begin
                    ns = SETUP_SEC;
                end else begin
                    ns = SETUP;
                end
            end else begin 
                 if(~setup_minute_month) begin 
                    if(blink_tick) begin
                        ns = SETUP_MIN;
                    end else begin
                        ns = SETUP;
                    end
                end else begin
                    if(~setup_hour_year) begin
                        if(blink_tick) begin
                            ns = SETUP_HOUR;
                        end else begin
                            ns = SETUP;
                        end
                    end 
                end
            end
        end
        SETUP_SEC: begin
            BLINK_SEC_DAY = 1'b1;
            if(display) begin
                if(~setup_minute_month ) begin
                    if(blink_tick) begin
                        ns = SETUP_MIN;
                    end else begin
                        ns = SETUP_SEC;
                    end
                end else begin 
                if(~setup_hour_year) begin
                        if(blink_tick) begin
                            ns = SETUP_HOUR;
                        end else begin
                            ns = SETUP_SEC;
                        end
                    end else begin 
                        ns = SETUP_SEC;
                    end
                end
            end else begin
                ns = DISPLAY;
            end
            
        end
        SETUP_MIN:begin
            BLINK_MIN_MONTH = 1'b1;
            if(display) begin
                if(~setup_second_day ) begin
                    if(blink_tick) begin
                        ns = SETUP_SEC;
                    end else begin
                        ns = SETUP_MIN;
                    end
                end else begin 
                    if(~setup_hour_year) begin
                        if(blink_tick) begin
                            ns = SETUP_HOUR;
                        end else begin
                            ns = SETUP_MIN;
                        end
                    end else begin 
                        ns = SETUP_MIN;
                    end
                end
            end else begin
                ns = DISPLAY;
            end
        end
        SETUP_HOUR: begin
            BLINK_HOUR_YEAR = 1'b1;
             if(display) begin
                if(~setup_second_day ) begin
                    if(blink_tick) begin
                        ns = SETUP_SEC;
                    end else begin
                        ns = SETUP_HOUR;
                    end
                end else begin 
                    if(~setup_minute_month) begin
                        if(blink_tick) begin
                            ns = SETUP_MIN;
                        end else begin
                            ns = SETUP_HOUR;
                        end
                    end else begin 
                        ns = SETUP_HOUR;
                    end
                end
            end else begin
                ns = DISPLAY;
            end
        end
        default: begin
            ns = DISPLAY;
            BLINK_HOUR_YEAR = 0;
            BLINK_MIN_MONTH = 0;
            BLINK_SEC_DAY = 0;
        end
    endcase
end
assign blink_sec_day = BLINK_SEC_DAY;
assign blink_min_month = BLINK_MIN_MONTH;
assign blink_hour_year = BLINK_HOUR_YEAR;
endmodule