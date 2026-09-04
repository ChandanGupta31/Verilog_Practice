// ==========================================
// Problem: Popcount3
// Link: https://hdlbits.01xz.net/wiki/Popcount3
// ==========================================

module top_module( 
    input [2:0] in,
    output [1:0] out );
	
    assign out = {in[2] & in [1] & in[0]} ? 2'b11 :
    {{in[2] & in[1]} | {in[1] & in[0]} | {in[2] & in[0]}} ? 2'b10:
    {in[2] | in[1] |in[0]} ? 2'b01 : 2'b00;
endmodule
