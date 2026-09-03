// ==========================================
// Problem: Mt2015 q4
// Link: https://hdlbits.01xz.net/wiki/Mt2015_q4
// ==========================================

module top_module (input x, input y, output z);
    assign z = {x || {~y}} ^ 0;
endmodule
