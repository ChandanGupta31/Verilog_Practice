// ==========================================
// Problem: D FF with Gates
// Link: https://hdlbits.01xz.net/wiki/Exams/m2014_q4d
// ==========================================

module top_module (
    input clk,
    input in, 
    output out);
    
    always @(posedge clk) out <= out^in;

endmodule
