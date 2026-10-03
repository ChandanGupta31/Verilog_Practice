// ==========================================
// Problem: Simulation Circuit 7
// Link: https://hdlbits.01xz.net/wiki/Sim/circuit7
// ==========================================

module top_module (
    input clk,
    input a,
    output q );
    
    always @(posedge clk) q <= ~a;

endmodule
