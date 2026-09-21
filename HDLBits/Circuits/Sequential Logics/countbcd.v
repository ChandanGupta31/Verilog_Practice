// ==========================================
// Problem: Count BCD
// Link: https://hdlbits.01xz.net/wiki/Countbcd
// ==========================================

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    bcdCounter counter1(clk, reset, 1'b1, q[3:0]);
    bcdCounter counter2(clk, reset, ena[1], q[7:4]);
    bcdCounter counter3(clk, reset, ena[2], q[11:8]);
    bcdCounter counter4(clk, reset, ena[3], q[15:12]);
    
    assign ena[1] = (q[3:0] == 9);
    assign ena[2] = (q[3:0] == 9) & (q[7:4] == 9);
    assign ena[3] = (q[3:0] == 9) & (q[7:4] == 9) & (q[11:8] == 9);

endmodule

module bcdCounter(
    input clk,
    input reset,
    input ena,
    output reg [3:0] q);
    always @(posedge clk) begin
        if (reset | (q==4'b1001 & ena)) q <= 0;
        else if(ena) q <= q +1;
        else q <= q;
    end
endmodule
