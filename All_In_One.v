module All_In_One (SW, KEY, HEX0, HEX6, HEX4, LEDR, LEDG, CLOCK_50);

    // Parameters
    parameter DATA_WIDTH = 4;

    // Input
    input CLOCK_50;
    input [17:0] SW;
    input [3:0] KEY;

    // Output
    output [3:0] LEDR;
    output [3:0] LEDG;
    output [6:0] HEX0;
    output [6:0] HEX4;
    output [6:0] HEX6;

    // Wires
    wire [DATA_WIDTH-1:0] write_data;
    wire [DATA_WIDTH-1:0] read_data_1, read_data_2;
    wire [DATA_WIDTH-1:0] ALU_result;
    wire zero;

    Hex_7_Seg disp_data_1(read_data_1[DATA_WIDTH-1:0], HEX6);
    Hex_7_Seg disp_data_2(read_data_2[DATA_WIDTH-1:0], HEX4);
    Hex_7_Seg disp_result(ALU_result[DATA_WIDTH-1:0], HEX0);

    MUX MUX_1(SW[17:17],
              SW[12:9],
              ALU_result[DATA_WIDTH-1:0],
              write_data[DATA_WIDTH-1:0]);

    Register_File register_file_1(SW[2:0],
                                  SW[5:3],
                                  SW[8:6],
                                  CLOCK_50,
                                  ~KEY[2:2],
                                  write_data[DATA_WIDTH-1:0],
                                  read_data_1[DATA_WIDTH-1:0],
                                  read_data_2[DATA_WIDTH-1:0]);

    ALU ALU_1(SW[16:15],
              read_data_1[DATA_WIDTH-1:0],
              read_data_2[DATA_WIDTH-1:0],
              ALU_result[DATA_WIDTH-1:0],
              zero);

endmodule
