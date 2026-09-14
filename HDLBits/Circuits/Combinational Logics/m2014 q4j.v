// ==========================================
// Problem: M2014 q4j
// Link: https://hdlbits.01xz.net/wiki/Exams/m2014_q4j
// ==========================================

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire [2:0] w;
    fadd i1(x[0], y[0], 0, w[0], sum[0]);
    fadd i2(x[1], y[1], w[0], w[1], sum[1]);
    fadd i3(x[2], y[2], w[1], w[2], sum[2]);
    fadd i4(x[3], y[3], w[2], sum[4], sum[3]);

endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );

    assign sum = a^b^cin;
    assign cout = (a&b)|(b&cin)|(cin&a);
endmodule
