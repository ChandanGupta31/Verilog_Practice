// ==========================================
// Problem: Edge Detector 2
// Link: https://hdlbits.01xz.net/wiki/Edgedetect2
// ==========================================

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] prev_in;
    
    always @(posedge clk) begin
        prev_in <= in;
        anyedge <= (~prev_in & in) | (~in & prev_in);
    end

endmodule
