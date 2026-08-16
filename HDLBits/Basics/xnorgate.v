// ==========================================
// Problem: XNOR Gate
// Link: https://hdlbits.01xz.net/wiki/Xnorgate
// ==========================================

module xnorgate( 
    input a, 
    input b, 
    output out );
    
    xnor xn(out, a, b);

endmodule