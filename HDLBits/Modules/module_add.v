// ==========================================
// Problem: Module Add
// Link: https://hdlbits.01xz.net/wiki/Module_add
// ==========================================

// module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire w1, w2;
    add16 instance1(a[15:0], b[15:0], 0, sum[15:0], w1);
    add16 instance2(a[31:16], b[31:16], w1, sum[31:16], w2);

endmodule
