// ==========================================
// Problem: FSM HDLC
// Link: https://hdlbits.01xz.net/wiki/Fsm_hdlc
// ==========================================

module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    parameter s0 = 4'd0, s1 = 4'd1, s2 = 4'd2, s3 = 4'd3,  s4 = 4'd4, s5 = 4'd5, di = 4'd6, s6 = 4'd7, fl = 4'd8, er = 4'd9;
    reg[3:0] state, next;
    
    always @(*) begin
        case (state)
            s0 : next = in ? s1 : s0;
            s1 : next = in ? s2 : s0;
            s2 : next = in ? s3 : s0;
            s3 : next = in ? s4 : s0;
            s4 : next = in ? s5 : s0;
            s5 : next = in ? s6 : di;
            di : next = in ? s1 : s0;
            s6 : next = in ? er : fl;
            fl : next = in ? s1 : s0;
            er : next = in ? er : s0;
            default : next = s0;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) state <= s0;
        else state <= next;
    end
    
    assign disc = state==di;
	assign flag = state==fl;
    assign err = state==er;
endmodule
