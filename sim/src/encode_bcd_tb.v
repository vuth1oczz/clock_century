`timescale 1ns/1ps

module bcd_encode_tb;

    parameter N = 16;

    reg clk;
    reg rst;
    reg [N-1:0] decimal;
    reg en;
    wire [3:0] unit;
    wire [3:0] tens;
    wire [3:0] hund;
    wire [3:0] thousand;

    // Instantiate DUT
    bcd_encode #(.N(N)) dut (
       
        .decimal(decimal),
        .unit(unit),
  
        .tens(tens),
        .hund(hund),
        .thousand(thousand)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100MHz clock (10ns period)
    end

    // Stimulus
    initial begin
        // Apply reset
        rst = 1; decimal = 0; en = 0;
        #20;
        rst = 0;  // release reset

        // Test cases
        #10 decimal = 16'd5643;     // expect 0000
        en = 1;
        #10 en =0;
        #1000;

        #10 decimal = 16'd4562;     // expect 9
         en = 1;
        #10 en =0;
        #2000;

        #10 decimal = 16'd4563;    // expect 45
         en = 1;
        #10 en =0;
        #2000;

        #10 decimal = 16'd9999;    // expect 99
        #200;

        #10 decimal = 16'd123;   // expect 123
        #200;

        #10 decimal = 16'd255;   // expect 255
        #200;

        #10 decimal = 16'd200;   // expect 200
        #200;

        $finish;
    end

    // Monitor
    initial begin
        $monitor("t=%0t decimal=%0d -> thousand=%0d hund=%0d tens=%0d unit=%0d",
                  $time, decimal, thousand, hund, tens, unit);
    end

endmodule
