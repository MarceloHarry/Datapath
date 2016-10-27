module ALU_Control(ALU_op, function_code, ALU_ctrl);

    // Parameters
    parameter ALU_OP_SIZE = 2;
    parameter FUNCTION_CODE_SIZE = 6;
    parameter ALU_CTRL_SIZE = 4;

    // Input
    input [ALU_OP_SIZE-1:0] ALU_op;
    input [FUNCTION_CODE_SIZE-1:0] function_code;

    // Output
    output reg [ALU_CTRL_SIZE-1:0] ALU_ctrl;

    always @(ALU_op, function_code)
    begin
        case (ALU_op)
            0:  ALU_ctrl <= 2;
            1:  ALU_ctrl <= 6;
            2:  begin
                    case (function_code)
                        15: ALU_ctrl <= 8;          // LUI
                        32: ALU_ctrl <= 2;          // ADD
                        34: ALU_ctrl <= 6;          // SUB
                        36: ALU_ctrl <= 0;          // AND
                        37: ALU_ctrl <= 1;          // OR
                        39: ALU_ctrl <= 12;         // NOR
                        42: ALU_ctrl <= 7;          // SLT
                        default: ALU_ctrl <= 15;    // Should not happen
                    endcase
                end
            default: ALU_ctrl <= 15;      // Should not happen
        endcase
    end

endmodule
