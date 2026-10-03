// ==========================================
// Problem: Nand 3
// Link: https://hdlbits.01xz.net/wiki/Bugs_nand3
// ==========================================

module top_module (input a, input b, input c, output out);//
	wire w1;
    andgate inst1 (w1, a, b, c, 1'b1, 1'b1);
    not n1(out, w1);

endmodule
