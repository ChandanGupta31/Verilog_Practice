// ==========================================
// Problem: Count Slow
// Link: https://hdlbits.01xz.net/wiki/Countslow
// ==========================================

module top_module (
    input clk,
    input slowena,
    input reset,
    output reg [3:0] q);
	
    always @(posedge clk) begin
        if(reset) q <= 4'b0000;
        else if(slowena & q==4'b1001) q <= 4'b0000;
        else if(slowena) q <= q+1;
        else q <= q;
    end
endmodule
