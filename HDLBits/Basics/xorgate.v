// ==========================================
// Problem: XOR Gate
// Link: https://hdlbits.01xz.net/wiki/Xorgate
// ==========================================

module top_module( 
    input a, 
    input b, 
    output out );
    xor xo(out, a, b);
endmodule