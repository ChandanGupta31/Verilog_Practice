module RAM8_8(clk, rst, w_enb, w_addr, rd_addr, data_in, data_out);
    input clk, rst, w_enb;
    input [2:0] w_addr, rd_addr;
    input [7:0] data_in;
    output reg [7:0] data_out;

    integer i;      // For loop
    reg [7:0] mem[7:0];      // memory instantiation

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i<8; i = i+1) begin
                mem[i] <= 0;
            end
            data_out <= 8'b0;
        end
        else begin
            if(w_enb) begin
                mem[w_addr] <= data_in;
            end
            data_out <= mem[rd_addr];
        end
    end
endmodule