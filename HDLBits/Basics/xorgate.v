// ==========================================
// Problem: XOR Gate
// Link: https://hdlbits.01xz.net/wiki/Xorgate
// ==========================================

module xorgate( 
    input a, 
    input b, 
    output out );
    xor xo(out, a, b);
endmodule