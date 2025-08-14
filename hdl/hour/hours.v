module hours (
    input clk,
    input rst,
    input display,
    input setup_hour,
    input done_minute,
    input inc_dec_hour,
    input tick,
    output [5:0] hours,
    output done_hour

);

reg [5:0] hour, hour_next;
reg done_hours, DONE_HOUR;

always @(posedge clk , posedge rst) begin
    if(rst) begin
        hour <= 0;
       // DONE_HOUR <= 0;
    end else begin
        
         hour <= hour_next;
    
     //   DONE_HOUR <= done_hours;
    end
end
always @(negedge clk, posedge rst) begin
     if(rst) begin
        DONE_HOUR <= 0;
    end else begin
        DONE_HOUR <= done_hours;
    end
end
always @(*) begin
    done_hours = 1'b0;
    if(~display) begin
            if(done_minute) begin
                if(~(|(hour ^ 6'b01_0111))) begin
                    done_hours = 1'b1;
                    hour_next = 'b0;
                end else begin
                    hour_next = hour +6'd1;
                    done_hours = 1'b0;
                end
                
            end else begin
                hour_next = hour;
            end
        end else begin
            if(~setup_hour) begin
                if(tick) begin
                        if(~(|(hour ^ 6'b01_1000))) begin
                        // done_hour = 1'b1;
                            hour_next = 'b0;
                        end else begin
                            if (inc_dec_hour) begin
                                if(~(|(hour ^ 6'd23))) begin
                                    hour_next = 6'd0;
                                    done_hours = 1'b0;
                                end else begin
                                    hour_next = hour +6'd1;
                                    done_hours = 1'b0;
                                end   
                            end else begin
                                if(~(|(hour ^ 6'd0))) begin
                                    hour_next = 6'd23;
                                    done_hours = 1'b0;
                                end else begin
                                    hour_next = hour -6'd1;
                                    done_hours = 1'b0;
                                end
                            end
                        end 
                end else begin
                        hour_next = hour;
                end 
            end else begin
                hour_next = hour;
            end
        end
end

assign hours = hour;
assign done_hour = DONE_HOUR;
endmodule