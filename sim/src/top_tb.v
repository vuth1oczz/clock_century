module top_tb();
reg clk, rst, display;
reg setup_second_day, setup_hour_year, setup_minute_month;
wire [5:0] second;
wire done;
reg swap_display;
wire [0:6] led_tens_min_month, led_unit_min_month, led_tens_second_day, 
            led_unit_second_day, led_unit_hour_year,led_tens_hour_year;
top dut(
    .clk(clk),
    .rst(rst),
    .display(display),
    .setup_second_day(setup_second_day),
    .setup_minute_month(setup_minute_month),
    .setup_hour_year(setup_hour_year),
    .swap_display(swap_display),
    .led_unit_min_month(led_unit_min_month),
    .led_tens_min_month(led_tens_min_month),
    .led_unit_second_day(led_unit_second_day),
    .led_tens_second_day(led_tens_second_day),
    .led_unit_hour_year(led_unit_hour_year),
    .led_tens_hour_year(led_tens_hour_year)
);
always #5 clk = ~clk;
initial begin
    clk =0;
    rst = 1;
    display =0;
    setup_second_day =0;
    setup_minute_month =0;
    setup_hour_year =0;
    swap_display = 0;
    #10;
    rst =0;
    #1800;
     display =1;
    
    // setup = 1;
    // #50;
    // setup = 0;
    // #50;
    // display = 0;
    // #50;
    swap_display = 1;
     #1800;
    $stop;
    // if(seconds.sec == 6'd10) begin
    //     $display("Stop!");
    //     $stop;
    // end else begin
    //     #1000000;
    //     $stop;
    // end

end
endmodule 