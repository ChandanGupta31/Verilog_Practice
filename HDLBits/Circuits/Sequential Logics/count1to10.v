// ==========================================
// Problem: Decade Counter Again
// Link: https://hdlbits.01xz.net/wiki/Count1to10
// ==========================================

module top_module (
    input clk,
    input reset,
    output reg [3:0] q);
    
    always @(posedge clk) begin
        if (reset | q==4'b1010) q <= 4'b0001;
        else q <= q+1;
    end

endmodule

