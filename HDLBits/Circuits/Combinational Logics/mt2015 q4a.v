// ==========================================
// Problem: Mt2015 q4a
// Link: https://hdlbits.01xz.net/wiki/Mt2015_q4a
// ==========================================

module top_module (input x, input y, output z);
    assign z = x & {1 ^ y};
endmodule
