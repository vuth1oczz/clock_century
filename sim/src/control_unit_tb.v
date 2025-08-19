`timescale 1ns/1ps

module control_unit_tb;

    reg clk;
    reg rst;
    reg display;
    reg blink_tick;
    reg setup_second_day;
    reg setup_minute_month;
    reg setup_hour_year;

    wire blink_sec_day;
    wire blink_min_month;
    wire blink_hour_year;

    // Instantiate DUT (Device Under Test)
    control_unit uut (
        .clk(clk),
        .rst(rst),
        .display(display),
        .blink_tick(blink_tick),
        .setup_second_day(setup_second_day),
        .setup_minute_month(setup_minute_month),
        .setup_hour_year(setup_hour_year),
        .blink_sec_day(blink_sec_day),
        .blink_min_month(blink_min_month),
        .blink_hour_year(blink_hour_year)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock 100 MHz (10ns period)
    end

    // Test stimulus
    initial begin
        // Khởi tạo
        rst = 1;
        display = 0;
        setup_second_day = 1;
        setup_minute_month = 1;
        setup_hour_year = 1;
        blink_tick = 0;
        // Reset giữ 20ns
        #20;
        rst = 0;

        // 1. Đang ở DISPLAY, nhấn display để sang SETUP
        #10 display = 1;
        #10 display = 0;

        // 2. Nhấn setup_second_day để sang SETUP_SEC
        #20 setup_second_day = 0;
        blink_tick = 1;
        #30 blink_tick = 0;
        #10 setup_second_day = 0;
        #10 display =1;
        // blink_tick = 0;
        // // 3. Nhấn setup_minute_month để sang SETUP_MIN
        // #20 setup_minute_month = 1;
        // #10 setup_minute_month = 0;
        // blink_tick =1;

        // // 4. Nhấn setup_hour_year để sang SETUP_HOUR
        // #20 setup_hour_year = 1;
        // #10 setup_hour_year = 0;

        // // 5. Nhấn display để quay lại DISPLAY
        // #20 display = 0;

        // Kết thúc mô phỏng
        #50 $finish;
    end

    // Monitor hiển thị
    initial begin
        $monitor("Time=%0t | State blink_sec_day=%b blink_min_month=%b blink_hour_year=%b", 
                  $time, blink_sec_day, blink_min_month, blink_hour_year);
    end

endmodule
