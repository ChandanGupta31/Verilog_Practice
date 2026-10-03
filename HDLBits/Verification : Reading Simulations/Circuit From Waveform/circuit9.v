// ==========================================
// Problem: Simulation Circuit 9
// Link: https://hdlbits.01xz.net/wiki/Sim/circuit9
// ==========================================

module top_module (
    input clk,
    input a,
    output [3:0] q );
    
    always @(posedge clk) begin
        if (a) q <= 3'd4;
        else q <= (q + 1'b1) % 3'd7;
    end

endmodule
