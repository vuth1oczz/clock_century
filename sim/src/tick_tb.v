`timescale 1ns/1ps

module tick_tb;

    reg clk;
    reg rst;
    wire tick;
    wire tick_blink;

    // Instantiate DUT
    tick uut (
        .clk(clk),
        .rst(rst),
        .tick(tick),
        .tick_blink(tick_blink)
    );

    // Clock generator: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        // Khởi tạo
        rst = 1;
        #20;       // Giữ reset trong 20ns
        rst = 0;

        // Chạy mô phỏng 300ns
        #300;

        $finish;
    end

    // Monitor kết quả
    initial begin
        $monitor("Time=%0t | tick=%b | tick_blink=%b", 
                  $time, tick, tick_blink);
    end

endmodule
