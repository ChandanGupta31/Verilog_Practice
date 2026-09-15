// ==========================================
// Problem: Kmap1
// Link: https://hdlbits.01xz.net/wiki/Kmap1
// ==========================================

module top_module(
    input a,
    input b,
    input c,
    output out  ); 
    
    assign out = (~a & ~b & ~c) ? 0 : 1;

endmodule
