// ==========================================
// Problem: Edge Detector
// Link: https://hdlbits.01xz.net/wiki/Edgedetect
// ==========================================

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] prev_signal;
    
    always @(posedge clk) begin
        prev_signal <= in;
    	pedge <= ~prev_signal & in;
    end

endmodule
