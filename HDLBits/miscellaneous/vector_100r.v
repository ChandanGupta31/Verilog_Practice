// ==========================================
// Problem: Vector 100r
// Link: https://hdlbits.01xz.net/wiki/Vector_100r
// ==========================================

module top_module( 
    input [99:0] in,
    output [99:0] out
);
    integer i=0;
    always @(*) begin
        for(i=0; i<100; i = i+1) out[i] = in[100-i-1];
    end

endmodule
