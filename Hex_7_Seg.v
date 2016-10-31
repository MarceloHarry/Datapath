module Hex_7_Seg(hex_digit,seg);

    // Input
    input [3:0] hex_digit;

    // Output
    output [6:0] seg;

    reg [6:0] seg;

    // ----a----
    // |       |
    // f       b
    // |       |
    // ----g----
    // |       |
    // e       c
    // |       |
    // ----d----

    // seg = {g,f,e,d,c,b,a};
    // 0 is on and 1 is off

    always @(hex_digit)
    begin
        case (hex_digit)
            4'h0: seg = 7'b1000000;
            4'h1: seg = 7'b1111001;
            4'h2: seg = 7'b0100100;
            4'h3: seg = 7'b0110000;
            4'h4: seg = 7'b0011001;
            4'h5: seg = 7'b0010010;
            4'h6: seg = 7'b0000010;
            4'h7: seg = 7'b1111000;
            4'h8: seg = 7'b0000000;
            4'h9: seg = 7'b0011000;
            4'ha: seg = 7'b0001000;
            4'hb: seg = 7'b0000011;
            4'hc: seg = 7'b1000110;
            4'hd: seg = 7'b0100001;
            4'he: seg = 7'b0000110;
            4'hf: seg = 7'b0001110;
        endcase
    end

endmodule
