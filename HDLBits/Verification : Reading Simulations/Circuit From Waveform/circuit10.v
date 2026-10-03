// ==========================================
// Problem: Simulation Circuit 10
// Link: https://hdlbits.01xz.net/wiki/Sim/circuit10
// ==========================================

module top_module (
    input clk,
    input a,
    input b,
    output q,
    output reg state  );
    
    always @(posedge clk) state <= state ? a|b : a&b;
    assign q = a ^ b ^ state;

endmodule
