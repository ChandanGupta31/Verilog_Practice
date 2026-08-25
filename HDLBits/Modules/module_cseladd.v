// ==========================================
// Problem: Module CSELADD
// Link: https://hdlbits.01xz.net/wiki/Module_cseladd
// ==========================================


// module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire adder1_cout;
    wire [15:0] adder2_out, adder3_out;
    add16 adder1(a[15:0], b[15:0], 0, sum[15:0], adder1_cout);
    add16 adder2(a[31:16], b[31:16], 0, adder2_out);
    add16 adder3(a[31:16], b[31:16], 1, adder3_out);
    assign sum[31:16] = (adder1_cout == 1'b1) ? adder3_out : adder2_out;

endmodule
