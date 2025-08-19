module led7seg (
    input  [3:0] binary_input, 
    output reg [0:6] led_output 
);

    always @(*) begin
        case (binary_input)
            4'b0000: led_output = 7'b0000001; // 0
            4'b0001: led_output = 7'b1001111; // 1
            4'b0010: led_output = 7'b0010010; // 2
            4'b0011: led_output = 7'b0000110; // 3
            4'b0100: led_output = 7'b1001100; // 4
            4'b0101: led_output = 7'b0100100; // 5
            4'b0110: led_output = 7'b0100000; // 6
            4'b0111: led_output = 7'b0001111; // 7
            4'b1000: led_output = 7'b0000000; // 8
            4'b1001: led_output = 7'b0000100; // 9
            4'b1010: led_output = 7'b1111110;  // dau -
            default: led_output = 7'b1111111; // Tắt tất cả
        endcase
    end

endmodule