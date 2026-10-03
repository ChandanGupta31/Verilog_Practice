// ==========================================
// Problem: Simulation Circuit 8
// Link: https://hdlbits.01xz.net/wiki/Sim/circuit8
// ==========================================

module top_module (
    input clock,
    input a,
    output reg p,
    output reg q );
    
    always @(a) begin
        if (clock) p = a;
        else p = p;
    end
    
    always @(negedge clock) q = p;

endmodule
