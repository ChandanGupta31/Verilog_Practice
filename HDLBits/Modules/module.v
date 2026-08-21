// ==========================================
// Problem: Module
// Link: https://hdlbits.01xz.net/wiki/Module
// ==========================================


module mod_a ( input in1, input in2, output out );
    // Module body
endmodule


module top_module ( input a, input b, output out );
    mod_a instance1(a, b, out);
endmodule
