// ==========================================
// Problem: Minimum SOP and POS
// Link: https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q2
// ==========================================

module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
    assign out_sop = (c & d) | (c & ~a & ~b);
    assign out_pos = c & (~a | b) & (~b | d);

endmodule
