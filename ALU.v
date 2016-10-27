module ALU (ALU_ctrl, data_1, data_2, ALU_result, zero);

    // Parameters
    parameter DATA_WIDTH = 4;   // Number of bits in each register
    parameter OP_SIZE = 4;

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
            0:  ALU_result <= data_1 & data_2;      // AND
            1:  ALU_result <= data_1 | data_2;      // OR
            2:  ALU_result <= data_1 + data_2;      // ADD
            6:  ALU_result <= data_1 - data_2;      // SUB
            7:  begin                               // SLT
                    if (data_1 < data_2)
                        ALU_result <= 1;
                    else
                        ALU_result <= 0;
                end
            8:  ALU_result <= data_2;               // LUI
            12: ALU_result <= ~(data_1 | data_2);   // NOR
            default: ALU_result <= 0;
        endcase
    end

endmodule
