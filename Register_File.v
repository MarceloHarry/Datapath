module Register_File(read_register_1,   // -- indice do registrador rs
                     read_register_2,   // -- indice do registrador rt
                     write_register,    // -- indice no registrador rd ou rt
                     clock,             // -- Relogio
                     reg_write,         // -- controle de escrita
                     write_data,        // -- entrada de dados para escrita
                     read_data_1,       // -- saida de dados do registrador rs
                     read_data_2);      // -- saida de dados do registrador rt

    // Parameters
    parameter REGFILE_WIDTH = 3;    // Number of bits for adressing the registers
    parameter DATA_WIDTH = 4;       // Number of bits in each register
    parameter REGFILE_R_WIDTH = 8;  // Number of registers (2^REGFILE_WIDTH)

    //Input
    input [0:0] reg_write, clock;
    input [REGFILE_WIDTH-1:0] read_register_1, read_register_2;
    input [REGFILE_WIDTH-1:0] write_register;
    input [DATA_WIDTH-1:0] write_data;

    // Output
    output [DATA_WIDTH-1:0] read_data_1, read_data_2;

    // Registers
    reg [DATA_WIDTH-1:0] registers[0:REGFILE_R_WIDTH-1];

    // Read the value in read_register_1 and read_register_2
    assign read_data_1 = registers[read_register_1];
    assign read_data_2 = registers[read_register_2];

    // Write data to write_register
    always @(posedge clock)
    begin
        if(reg_write)
            registers[write_register] <= write_data;
    end

endmodule
