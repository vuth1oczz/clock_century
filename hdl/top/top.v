module top(
    input clk, 
    input rst,
    input display,
    input inc_dec,
    input setup_second_day,
    input setup_minute_month,
    input setup_hour_year,
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
wire [5:0] second, minute, hour;
wire done_sec, done_minute, done_hour, done_day, done_month, done_year;
wire [5:0] month, day;
wire [6:0] year;
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

reg setup_second, setup_minute, setup_hour;
reg setup_day, setup_month, setup_year;
always @(*) begin
    case({swap_display, display})
        2'b01: begin    // setup second, minute, hour
            setup_second = setup_second_day;
            setup_minute = setup_minute_month;
            setup_hour = setup_hour_year;
            setup_day = 1'b1;
            setup_month = 1'b1;
            setup_year = 1'b1;
         end
         2'b11: begin
            setup_second = 1'b1;
            setup_minute = 1'b1;
            setup_hour = 1'b1;
            setup_day = setup_second_day;
            setup_month = setup_minute_month;
            setup_year = setup_hour_year;
         end
         default: begin
            setup_second = 1'b1;
            setup_minute = 1'b1;
            setup_hour = 1'b1;
            setup_day = 1'b1;
            setup_month = 1'b1;
            setup_year = 1'b1;
         end
    endcase
end
wire tick;
tick ticks(
    .clk(clk),
    .rst(rst),
    .tick(tick)
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
wire [3:0] unit_min, tens_min;
wire [3:0] unit_sec, tens_sec ;
wire [3:0] unit_hour, tens_hour ;
wire [3:0] unit_day, tens_day;
wire [3:0] unit_month, tens_month ;
wire [3:0] unit_year, tens_year ;
decode decode_sec(
    .a({1'b0,second}),
    .unit(unit_sec),
    .tens(tens_sec)
);
decode decode_min(
    .a({1'b0,minute}),
    .unit(unit_min),
    .tens(tens_min)
);
decode decode_hour(
    .a({1'b0,hour}),
    .unit(unit_hour),
    .tens(tens_hour)
);
decode decode_day(
    .a({1'b0,day}),
    .unit(unit_day),
    .tens(tens_day)
);
decode decode_month(
    .a({1'b0,month}),
    .unit(unit_month),
    .tens(tens_month)
);
decode decode_year(
    .a(year),
    .unit(unit_year),
    .tens(tens_year)
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
always @(*) begin
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
            led_tens_hour_year_default = 7'b0010010;
            led_unit_hour_year_default = 7'b0000001;
    end else begin
            led_unit_min_month = led_unit_second;
            led_tens_min_month = led_tens_second;
            led_unit_second_day=7'b1111111;
            led_tens_second_day = 7'b111111;
            led_unit_hour_year = led_unit_hour;
            led_tens_hour_year = led_tens_hour;
            led_tens_hour_year_default = led_tens_min;
            led_unit_hour_year_default = led_unit_min;
    end
end
endmodule