module day_tb();
reg clk, rst,display, setup_day, done_hour;
reg [5:0] curr_month;
reg [6:0] curr_year;
reg tick;
wire [5:0] day;
wire done_day;
days dut (
    .clk(clk),
    .rst(rst),
    .display(display),
    .setup_day(setup_day),
    .done_hour(done_hour),
    .curr_month(curr_month),
    .curr_year(curr_year),
    .day(day),
    .done_day(done_day)
);
always #5 clk = ~clk;
initial begin
    clk =0;
    rst =1;
    display =0;
    done_hour = 0;
    curr_month = 6'd2;
    curr_year = 7'd32;
    tick =0;
    #10; rst =0;
    #50;
    done_hour =1;
    #1000;
    $stop;

end
endmodule