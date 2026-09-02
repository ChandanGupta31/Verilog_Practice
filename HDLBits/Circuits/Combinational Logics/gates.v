// ==========================================
// Problem: Gates
// Link: https://hdlbits.01xz.net/wiki/Gates
// ==========================================

module top_module( 
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);
    and a1(out_and, a, b);
    or o1(out_or, a, b);
    xor x1(out_xor, a, b);
    nand n1(out_nand, a, b);
    nor n2(out_nor, a, b);
    xnor x2(out_xnor, a, b);
    and a2(out_anotb, a, {~b});

endmodule
