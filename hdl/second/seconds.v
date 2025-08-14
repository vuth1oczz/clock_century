module seconds (
    input clk,
    input rst,
    input display,
    input setup_second,
    input inc_dec_second,
    input tick,
    output [5:0] second,
    output done_sec

);

reg [5:0] sec, sec_next;
reg done, DONE;
always @(posedge clk , posedge rst) begin
    if(rst) begin
        sec <= 0;
       // DONE <= 0;
    end else begin
       
            sec <= sec_next;
       
      //  DONE <= done;
    end
end
always @(negedge clk, posedge rst) begin
     if(rst) begin
        DONE <= 0;
    end else begin
        DONE <= done;
    end
end
always @(*) begin
    //done = 1'b0;
    if(~display) begin
        if(tick) begin
            if(~(|(sec ^ 6'b11_1011))) begin
                    done = 1'b1;
                    sec_next = 'b0;
                end else begin
                    sec_next = sec +6'd1;
                    done = 1'b0;
                end
                
        end else begin
                sec_next = sec;
                done = 1'b0;
            end
        end else begin
            if(~setup_second) begin
                if(tick) begin
                if(~(|(sec ^ 6'b11_1100))) begin
                  //  done = 1'b1;
                    sec_next = 'b0;
                end else begin
                    if(inc_dec_second) begin
                        if(~(|(sec ^ 6'd59))) begin
                            sec_next = 6'd0;
                            done = 1'b0;
                        end else begin
                            sec_next = sec +6'd1;
                            done = 1'b0;
                        end
                        
                    end else begin
                       if(~(|(sec ^ 6'd0))) begin
                            sec_next = 6'd59;
                            done = 1'b0;
                        end else begin
                            sec_next = sec -6'd1;
                            done = 1'b0;
                        end
                    end
                end 
                end else begin
                    sec_next = sec ;
                end
            end else begin
                sec_next = sec;
            end 
        end
end

assign second = sec;
assign done_sec = DONE;
endmodule