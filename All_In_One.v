`include "ALU.v"
`include "ALU_Control.v"
`include "Register_File.v"
`include "MUX.v"
`include "Switches.v"

module All_In_One (SW, KEY, HEX, LEDR, LEDG, CLOCK_50);

    // Parameters
    parameter DATA_WIDTH = 4;

    // Input
    input CLOCK_50;
    input [17:0] SW;
    input [3:0] KEY;
    input [0:0] HEX;

    // Output
    output [3:0] LEDR;
    output [3:0] LEDG;

    // Registers
    wire [DATA_WIDTH-1:0] write_data;
    wire [DATA_WIDTH-1:0] read_data_1, read_data_2;
    wire [DATA_WIDTH-1:0] ALU_result;
    wire zero;

    MUX MUX_1(SW[17:17],
              SW[12:9],
              ALU_result[DATA_WIDTH-1:0],
              write_data[DATA_WIDTH-1:0]);

    Register_File Register_File_1(SW[2:0],
                                  SW[5:3],
                                  SW[8:6],
                                  CLOCK_50,
                                  KEY[2:2],
                                  write_data[DATA_WIDTH-1:0],
                                  read_data_1[DATA_WIDTH-1:0],
                                  read_data_2[DATA_WIDTH-1:0]);

    // TODO: Fix ALU_ctrl size
    ALU ALU_1(SW[16:15],
              read_data_1[DATA_WIDTH-1:0],
              read_data_2[DATA_WIDTH-1:0],
              ALU_result[DATA_WIDTH-1:0],
              zero);

endmodule
