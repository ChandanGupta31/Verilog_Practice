// ==========================================
// Problem: Module ADDSUB
// Link: https://hdlbits.01xz.net/wiki/Module_addsub
// ==========================================

// module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );


module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire adder1_cout;
    wire [31:0] updated_b;
    assign updated_b = b ^ {32{sub}};
    
    add16 adder1(a[15:0], updated_b[15:0], sub, sum[15:0], adder1_cout);
    add16 adder2(a[31:16], updated_b[31:16], adder1_cout, sum[31:16]);

endmodule
