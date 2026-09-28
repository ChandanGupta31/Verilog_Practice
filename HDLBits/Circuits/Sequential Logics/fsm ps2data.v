// ==========================================
// Problem: FSM PS2 Data
// Link: https://hdlbits.01xz.net/wiki/Fsm_ps2data
// ==========================================

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output done); //

	parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    reg [1:0] state, next;
    
    always @(*) begin
        case (state)
            A : next = in[3] ? B : A;
            B : next = C;
            C : next = D;
            D : next = in[3] ? B : A;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) state <= A;
        else state <= next;
        
        if(next==B) out_bytes[23:16] <= in;
        else if (next==C) out_bytes[15:8] <= in;
        else if (next==D) out_bytes[7:0] <= in;
        else out_bytes <= out_bytes;
    end
    
    assign done = state==D;

endmodule
