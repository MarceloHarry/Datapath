module MUX (control, data, result, write_data);

    // Parameters
    parameter DATA_WIDTH = 4;

    // Input
    input [0:0] control;
    input [DATA_WIDTH-1:0] data, result;

    // Output
    output reg [DATA_WIDTH-1:0] write_data;

    always @(control, data, result)
    begin
        if (control)
            write_data <= result;
        else
            write_data <= data;
    end

endmodule
