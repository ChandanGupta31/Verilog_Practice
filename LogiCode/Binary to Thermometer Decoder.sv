// ==========================================
// Problem: Binary to Thermometer Decoder
// Link: https://logi-code.com/challenge/binary-to-thermometer-decoder-verilog-combinational-medium-interview-questions/
// ==========================================

module bin_to_thermo #(
    parameter DIN_WIDTH = 8
) (
    input  logic [DIN_WIDTH-1:0]    din,
    output logic [2**DIN_WIDTH-1:0] dout
);
    always_comb begin
        for (int i = 0; i < (2**DIN_WIDTH); i++) begin
            if (i < din)
                dout[i] = 1'b1;
            else
                dout[i] = 1'b0;
        end
    end
endmodule