module top(
    input clk, 
    input rst,
    input display,
    input inc_dec,
    input   setup_second_day,
    input  setup_minute_month,
    input  setup_hour_year,
    input swap_display,
    output reg [0:6] led_unit_min_month,
    output reg [0:6] led_tens_min_month,
    output reg [0:6] led_unit_second_day,
    output reg [0:6] led_tens_second_day,
    output reg [0:6] led_unit_hour_year,
    output reg [0:6] led_tens_hour_year,
    output reg [0:6] led_unit_hour_year_default,
    output reg [0:6] led_tens_hour_year_default
);
wire [6:0] second;
wire [5:0]  minute, hour;
wire done_sec, done_minute, done_hour, done_day, done_month, done_year;
wire [5:0] month, day;
wire [15:0] year;
wire [0:6] led_unit_min;
wire [0:6] led_tens_min;
wire [0:6] led_unit_second;
wire [0:6] led_tens_second;
wire [0:6] led_unit_hour;
wire [0:6] led_tens_hour;

wire [0:6] led_unit_month;
wire [0:6] led_tens_month;
wire [0:6] led_unit_day;
wire [0:6] led_tens_day;
wire [0:6] led_unit_year;
wire [0:6] led_tens_year;
wire [0:6] led_hund_year;
wire [0:6] led_thousand_year;

reg setup_second, setup_minute, setup_hour;
reg setup_day, setup_month, setup_year;
always @(posedge clk, posedge rst) begin
    if(rst) begin
        setup_second <= 1'b1;
        setup_minute <= 1'b1;
        setup_hour <= 1'b1;
        setup_day <= 1'b1;
        setup_month <= 1'b1;
        setup_year <= 1'b1;

    end else begin 
        case({swap_display, display})
            2'b01: begin    // setup second, minute, hour
                setup_second <= setup_second_day;
                setup_minute <= setup_minute_month;
                setup_hour <= setup_hour_year;
                setup_day <= 1'b1;
                setup_month <= 1'b1;
                setup_year <= 1'b1;
            end
            2'b11: begin
                setup_second <= 1'b1;
                setup_minute <= 1'b1;
                setup_hour <= 1'b1;
                setup_day <= setup_second_day;
                setup_month <= setup_minute_month;
                setup_year <= setup_hour_year;
            end
            default: begin
                setup_second <= 1'b1;
                setup_minute <= 1'b1;
                setup_hour <= 1'b1;
                setup_day <= 1'b1;
                setup_month <= 1'b1;
                setup_year <= 1'b1;
            end
        endcase
    end
end
wire tick, tick_blink;
tick ticks(
    .clk(clk),
    .rst(rst),
    .tick(tick),
    .tick_blink(tick_blink)
);
wire blink_sec_day;
wire blink_min_month;
wire blink_hour_year;
wire nhuan;
control_unit control_unit(
    .clk(clk),
    .rst(rst),
    .display(display),
    .blink_tick(tick),
    .setup_second_day(setup_second_day),
    .setup_minute_month(setup_minute_month),
    .setup_hour_year(setup_hour_year),
    .blink_sec_day(blink_sec_day),
    .blink_min_month(blink_min_month),
    .blink_hour_year(blink_hour_year)
);
seconds seconds(
    .clk(clk),
    .rst(rst),
    .display(display),
    .setup_second(setup_second),
    .inc_dec_second(inc_dec),
    .tick(tick),
    .second(second),
    .done_sec(done_sec)
);
minutes mintues(
    .clk(clk),
    .rst(rst),
    .display(display),
    .setup_minute(setup_minute),
    .inc_dec_min(inc_dec),
    .tick(tick),
    .minute(minute),
    .done_sec(done_sec),
    .done_minute(done_minute)

);
hours hours (
    .clk(clk),
    .rst(rst),
    .display(display),
    .setup_hour(setup_hour),

    .inc_dec_hour(inc_dec),
    .tick(tick),
    .hours(hour),
    .done_minute(done_minute),
    .done_hour(done_hour)
);
days days (
    .clk(clk),
    .rst(rst),
    .display(display),
    .setup_day(setup_day),
    .inc_dec_day(inc_dec),
    .done_hour(done_hour),
    .nhuan(nhuan),
    .tick(tick),
    .curr_month(month),
    .curr_year(year),
    .day(day),
    .done_day(done_day)
);
months months (
    .clk(clk),
    .rst(rst),
    .display(display),
    .setup_month(setup_month),
    .inc_dec_month(inc_dec),
    .done_day(done_day),
    .tick(tick),
    .done_month(done_month),
    .month(month)
);
years years (
    .clk(clk),
    .rst(rst),
    .display(display),
    .setup_year(setup_year),
    .inc_dec_year(inc_dec),
    .done_month(done_month),
    .tick(tick),
    .done_year(done_year),
    .year(year)
);
wire [3:0] unit_min, tens_min, hund_min, thousand_min;
wire [3:0] unit_sec, tens_sec , hund_sec, thousand_sec;
wire [3:0] unit_hour, tens_hour , hund_hour, thousand_hour;
wire [3:0] unit_day, tens_day, hund_day, thousand_day;
wire [3:0] unit_month, tens_month , hund_month, thousand_month;
wire [3:0] unit_year, tens_year , hund_year, thousand_year;
bcd_encode #(.N(8)) bcd_encode_sec 
(
    .decimal({2'b0,second}),
    .unit(unit_sec),
    .tens(tens_sec)
 
);
bcd_encode #(.N(8)) bcd_encode_min 
(
    .decimal({2'b0,minute}),
    .unit(unit_min),
    .tens(tens_min)
 
);
bcd_encode #(.N(8)) bcd_encode_hour
(
    .decimal({2'b0,hour}),
    .unit(unit_hour),
    .tens(tens_hour)

);
bcd_encode #(.N(8)) bcd_encode_day 
(
    .decimal({2'b0,day}),
    .unit(unit_day),
    .tens(tens_day)

);
bcd_encode #(.N(8)) bcd_encode_month 
(
    .decimal({2'b0,month}),
    .unit(unit_month),
    .tens(tens_month)
);

encode_bcd #(.N(16)) bcd_encode_year 
(
    .decimal(year),
    .unit(unit_year),
    .tens(tens_year),
    .hund(hund_year),
    .thousand(thousand_year),
    .nhuan_(nhuan)
);
led7seg led7seg_unit_sec(
    .binary_input(unit_sec),
    .led_output(led_unit_second)
);
led7seg led7seg_tens_sec(
    .binary_input(tens_sec),
    .led_output(led_tens_second)
);
led7seg led7seg_unit_min(
    .binary_input(unit_min),
    .led_output(led_unit_min)
);
led7seg led7seg_tens_min(
    .binary_input(tens_min),
    .led_output(led_tens_min)
);
led7seg led7seg_unit_hour(
    .binary_input(unit_hour),
    .led_output(led_unit_hour)
);
led7seg led7seg_tens_hour(
    .binary_input(tens_hour),
    .led_output(led_tens_hour)
);
led7seg led7seg_unit_day(
    .binary_input(unit_day),
    .led_output(led_unit_day)
);
led7seg led7seg_tens_day(
    .binary_input(tens_day),
    .led_output(led_tens_day)
);
led7seg led7seg_unit_month(
    .binary_input(unit_month),
    .led_output(led_unit_month)
);
led7seg led7seg_tens_month(
    .binary_input(tens_month),
    .led_output(led_tens_month)
);
led7seg led7seg_unit_year(
    .binary_input(unit_year),
    .led_output(led_unit_year)
);
led7seg led7seg_tens_year(
    .binary_input(tens_year),
    .led_output(led_tens_year)
);
led7seg led7seg_hund_year(
    .binary_input(hund_year),
    .led_output(led_hund_year)
);
led7seg led7seg_thousand_year(
    .binary_input(thousand_year),
    .led_output(led_thousand_year)
);
always @(swap_display or display or tick_blink or blink_sec_day or blink_min_month or blink_hour_year) begin
    led_unit_min_month = led_unit_min;
    led_tens_min_month = led_tens_min;
    led_unit_second_day= led_unit_second;
    led_tens_second_day = led_tens_second;
    led_unit_hour_year = led_unit_hour;
    led_tens_hour_year = led_tens_hour;
    led_tens_hour_year_default = 7'b1111111;
    led_unit_hour_year_default = 7'b1111111;
    if(swap_display) begin
            led_unit_min_month = led_unit_month;
            led_tens_min_month = led_tens_month;
            led_unit_second_day= led_unit_day;
            led_tens_second_day = led_tens_day;
            led_unit_hour_year = led_unit_year;
            led_tens_hour_year = led_tens_year;
            led_tens_hour_year_default = led_thousand_year;
            led_unit_hour_year_default = led_hund_year;
    end else begin
        if(display) begin
            if(tick_blink  & blink_sec_day ) begin
                led_unit_hour_year_default = 7'b1111111;
                led_tens_hour_year_default = 7'b1111111;
            end else begin
                
                led_unit_hour_year_default = led_unit_second;
                led_tens_hour_year_default = led_tens_second;
            end
            if(tick_blink  & blink_min_month ) begin
                led_unit_min_month = 7'b1111111;
                led_tens_min_month = 7'b1111111;
            end else begin
               
                led_tens_min_month = led_tens_min;
                led_unit_min_month = led_unit_min;
            end
            if(tick_blink  & blink_hour_year ) begin
               led_unit_second_day = 7'b1111111;
                led_tens_second_day = 7'b1111111;
            end else begin
                
               led_unit_second_day = led_unit_hour;
               led_tens_second_day = led_tens_hour;
            end
            led_unit_hour_year= 7'b1111111;
            led_tens_hour_year = 7'b1111111;
        end else begin
                led_unit_hour_year_default = led_unit_second;
                led_tens_hour_year_default = led_tens_second;
                led_tens_min_month = led_tens_min;
                led_unit_min_month = led_unit_min;
                led_unit_second_day = led_unit_hour;
                led_tens_second_day = led_tens_hour;
                led_unit_hour_year= 7'b1111111;
                led_tens_hour_year = 7'b1111111;
        end
    end
end
endmodule