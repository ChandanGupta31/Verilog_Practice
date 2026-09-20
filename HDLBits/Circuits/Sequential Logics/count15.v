// ==========================================
// Problem: 4 bit binary counter
// Link: https://hdlbits.01xz.net/wiki/Count15
// ==========================================

module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg [3:0] q);
    
    always @(posedge clk) begin
        if (reset) q <= 4'b0;
        else q <= q+1;
    end
endmodule
