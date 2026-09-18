// ==========================================
// Problem: D FF with Gates
// Link: https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q4
// ==========================================

module top_module (
    input clk,
    input x,
    output z
); 
    reg [2:0] out;
    // sequential logic
    always @(posedge clk) begin
        out[0] <= ~out[0] | x;
        out[1] <= ~out[1] & x;
        out[2] <= out[2] ^ x;
    end
    
    // combinational logic
    assign z = ~(out[0] | out[1] | out[2]);

endmodule
