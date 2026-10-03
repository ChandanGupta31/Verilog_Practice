// ==========================================
// Problem: Simulation Circuit 3
// Link: https://hdlbits.01xz.net/wiki/Sim/circuit3
// ==========================================

module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = (a || b) && (c || d);

endmodule
