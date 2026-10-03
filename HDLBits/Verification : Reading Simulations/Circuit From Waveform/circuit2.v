// ==========================================
// Problem: Simulation Circuit 2
// Link: https://hdlbits.01xz.net/wiki/Sim/circuit2
// ==========================================

module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = ~(a ^ b ^ c ^ d);

endmodule
