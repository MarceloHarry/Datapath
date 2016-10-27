// Top - level module
module Switches (SW , CLOCK_50 , LEDR );

    // Input
    input [7:0] SW;
    input CLOCK_50;

    // Output
    output reg [7:0] LEDR;

    always @(posedge CLOCK_50)
        LEDR [7:0] <= SW [7:0];

endmodule
