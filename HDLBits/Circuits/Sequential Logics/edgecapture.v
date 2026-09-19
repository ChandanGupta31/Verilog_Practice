// ==========================================
// Problem: Edge Capture
// Link: https://hdlbits.01xz.net/wiki/Edgecapture
// ==========================================

module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);
    reg [31:0] prev_in;

    always @(posedge clk) begin
        prev_in <= in; 
        if (reset) out <= 32'b0;
        else out <= out | (prev_in & ~in); 
    end
endmodule