// ==========================================
// Problem: BCD ADD 100
// Link: https://hdlbits.01xz.net/wiki/Bcdadd100
// ==========================================

module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    genvar i;
    wire [99:0] carry;
    
    generate
        for(i=0; i<100; i=i+1) begin : bcd_adder
            if (i==0) bcd_fadd(a[3:0], b[3:0], cin, carry[i], sum[3:0]);
            else bcd_fadd(a[i*4+3:i*4], b[i*4+3:i*4], carry[i-1], carry[i], sum[i*4+3:i*4]);  
    	end
	endgenerate
    
    assign cout = carry[99];

endmodule
