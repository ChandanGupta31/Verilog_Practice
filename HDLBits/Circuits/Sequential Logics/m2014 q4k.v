// ==========================================
// Problem: Shift Register
// Link: https://hdlbits.01xz.net/wiki/Exams/m2014_q4k
// ==========================================

module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output reg out);

    reg[2:0] q;
    always @(posedge clk) begin
        if (~resetn) {q, out} <= 4'h0;
        else {q, out} <= {in, q};
    end
endmodule
