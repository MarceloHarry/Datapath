module ALU (ALU_ctrl, data_1, data_2, ALU_result, zero);

    // Parameters
    parameter DATA_WIDTH = 4;   // Number of bits in each register
    parameter OP_SIZE = 2;

    // Input
    input [OP_SIZE-1:0] ALU_ctrl;
    input [DATA_WIDTH-1:0] data_1, data_2;

    // Output
    output reg [DATA_WIDTH-1:0] ALU_result;
    output zero;

    // zero is true if ALU_result is 0
    assign zero = (ALU_result == 0);

    always @(ALU_ctrl, data_1, data_2)
    begin
        case (ALU_ctrl)
          0: ALU_result = data_1 + data_2;
          1: ALU_result = data_1 - data_2;
          2: ALU_result = data_1 & data_2;
          3: ALU_result = data_1 | data_2;
        endcase
    end

endmodule
