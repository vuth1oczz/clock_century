module decode (
    input  [6:0] a,
    output reg [3:0] unit,
    output reg [3:0] tens
);

always @(*) begin
    case (a)
        7'd0  : begin unit = 4'd0; tens = 4'd0; end
        7'd1  : begin unit = 4'd1; tens = 4'd0; end
        7'd2  : begin unit = 4'd2; tens = 4'd0; end
        7'd3  : begin unit = 4'd3; tens = 4'd0; end
        7'd4  : begin unit = 4'd4; tens = 4'd0; end
        7'd5  : begin unit = 4'd5; tens = 4'd0; end
        7'd6  : begin unit = 4'd6; tens = 4'd0; end
        7'd7  : begin unit = 4'd7; tens = 4'd0; end
        7'd8  : begin unit = 4'd8; tens = 4'd0; end
        7'd9  : begin unit = 4'd9; tens = 4'd0; end
        7'd10 : begin unit = 4'd0; tens = 4'd1; end
        7'd11 : begin unit = 4'd1; tens = 4'd1; end
        7'd12 : begin unit = 4'd2; tens = 4'd1; end
        7'd13 : begin unit = 4'd3; tens = 4'd1; end
        7'd14 : begin unit = 4'd4; tens = 4'd1; end
        7'd15 : begin unit = 4'd5; tens = 4'd1; end
        7'd16 : begin unit = 4'd6; tens = 4'd1; end
        7'd17 : begin unit = 4'd7; tens = 4'd1; end
        7'd18 : begin unit = 4'd8; tens = 4'd1; end
        7'd19 : begin unit = 4'd9; tens = 4'd1; end
        7'd20 : begin unit = 4'd0; tens = 4'd2; end
        7'd21 : begin unit = 4'd1; tens = 4'd2; end
        7'd22 : begin unit = 4'd2; tens = 4'd2; end
        7'd23 : begin unit = 4'd3; tens = 4'd2; end
        7'd24 : begin unit = 4'd4; tens = 4'd2; end
        7'd25 : begin unit = 4'd5; tens = 4'd2; end
        7'd26 : begin unit = 4'd6; tens = 4'd2; end
        7'd27 : begin unit = 4'd7; tens = 4'd2; end
        7'd28 : begin unit = 4'd8; tens = 4'd2; end
        7'd29 : begin unit = 4'd9; tens = 4'd2; end
        7'd30 : begin unit = 4'd0; tens = 4'd3; end
        7'd31 : begin unit = 4'd1; tens = 4'd3; end
        7'd32 : begin unit = 4'd2; tens = 4'd3; end
        7'd33 : begin unit = 4'd3; tens = 4'd3; end
        7'd34 : begin unit = 4'd4; tens = 4'd3; end
        7'd35 : begin unit = 4'd5; tens = 4'd3; end
        7'd36 : begin unit = 4'd6; tens = 4'd3; end
        7'd37 : begin unit = 4'd7; tens = 4'd3; end
        7'd38 : begin unit = 4'd8; tens = 4'd3; end
        7'd39 : begin unit = 4'd9; tens = 4'd3; end
        7'd40 : begin unit = 4'd0; tens = 4'd4; end
        7'd41 : begin unit = 4'd1; tens = 4'd4; end
        7'd42 : begin unit = 4'd2; tens = 4'd4; end
        7'd43 : begin unit = 4'd3; tens = 4'd4; end
        7'd44 : begin unit = 4'd4; tens = 4'd4; end
        7'd45 : begin unit = 4'd5; tens = 4'd4; end
        7'd46 : begin unit = 4'd6; tens = 4'd4; end
        7'd47 : begin unit = 4'd7; tens = 4'd4; end
        7'd48 : begin unit = 4'd8; tens = 4'd4; end
        7'd49 : begin unit = 4'd9; tens = 4'd4; end
        7'd50 : begin unit = 4'd0; tens = 4'd5; end
        7'd51 : begin unit = 4'd1; tens = 4'd5; end
        7'd52 : begin unit = 4'd2; tens = 4'd5; end
        7'd53 : begin unit = 4'd3; tens = 4'd5; end
        7'd54 : begin unit = 4'd4; tens = 4'd5; end
        7'd55 : begin unit = 4'd5; tens = 4'd5; end
        7'd56 : begin unit = 4'd6; tens = 4'd5; end
        7'd57 : begin unit = 4'd7; tens = 4'd5; end
        7'd58 : begin unit = 4'd8; tens = 4'd5; end
        7'd59 : begin unit = 4'd9; tens = 4'd5; end
        7'd60 : begin unit = 4'd0; tens = 4'd6; end
        7'd61 : begin unit = 4'd1; tens = 4'd6; end
        7'd62 : begin unit = 4'd2; tens = 4'd6; end
        7'd63 : begin unit = 4'd3; tens = 4'd6; end
        7'd64 : begin unit = 4'd4; tens = 4'd6; end
        7'd65 : begin unit = 4'd5; tens = 4'd6; end
        7'd66 : begin unit = 4'd6; tens = 4'd6; end
        7'd67 : begin unit = 4'd7; tens = 4'd6; end
        7'd68 : begin unit = 4'd8; tens = 4'd6; end
        7'd69 : begin unit = 4'd9; tens = 4'd6; end
        7'd70 : begin unit = 4'd0; tens = 4'd7; end
        7'd71 : begin unit = 4'd1; tens = 4'd7; end
        7'd72 : begin unit = 4'd2; tens = 4'd7; end
        7'd73 : begin unit = 4'd3; tens = 4'd7; end
        7'd74 : begin unit = 4'd4; tens = 4'd7; end
        7'd75 : begin unit = 4'd5; tens = 4'd7; end
        7'd76 : begin unit = 4'd6; tens = 4'd7; end
        7'd77 : begin unit = 4'd7; tens = 4'd7; end
        7'd78 : begin unit = 4'd8; tens = 4'd7; end
        7'd79 : begin unit = 4'd9; tens = 4'd7; end
        7'd80 : begin unit = 4'd0; tens = 4'd8; end
        7'd81 : begin unit = 4'd1; tens = 4'd8; end
        7'd82 : begin unit = 4'd2; tens = 4'd8; end
        7'd83 : begin unit = 4'd3; tens = 4'd8; end
        7'd84 : begin unit = 4'd4; tens = 4'd8; end
        7'd85 : begin unit = 4'd5; tens = 4'd8; end
        7'd86 : begin unit = 4'd6; tens = 4'd8; end
        7'd87 : begin unit = 4'd7; tens = 4'd8; end
        7'd88 : begin unit = 4'd8; tens = 4'd8; end
        7'd89 : begin unit = 4'd9; tens = 4'd8; end
        7'd90 : begin unit = 4'd0; tens = 4'd9; end
        7'd91 : begin unit = 4'd1; tens = 4'd9; end
        7'd92 : begin unit = 4'd2; tens = 4'd9; end
        7'd93 : begin unit = 4'd3; tens = 4'd9; end
        7'd94 : begin unit = 4'd4; tens = 4'd9; end
        7'd95 : begin unit = 4'd5; tens = 4'd9; end
        7'd96 : begin unit = 4'd6; tens = 4'd9; end
        7'd97 : begin unit = 4'd7; tens = 4'd9; end
        7'd98 : begin unit = 4'd8; tens = 4'd9; end
        7'd99 : begin unit = 4'd9; tens = 4'd9; end
        default: begin unit = 4'd0; tens = 4'd0; end
    endcase
end

endmodule
