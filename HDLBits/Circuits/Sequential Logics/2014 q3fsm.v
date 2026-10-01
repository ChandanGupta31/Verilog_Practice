// ==========================================
// Problem: Q3 FSM
// Link: https://hdlbits.01xz.net/wiki/Exams/2014_q3fsm
// ==========================================

module top_module(
    input clk,
    input reset,
    input s,
    input w,
    output z
);
    parameter A   = 3'd0,
              B   = 3'd1,
              C   = 3'd2,
              S10 = 3'd3,
              S11 = 3'd4,
              S20 = 3'd5,
              S21 = 3'd6,
              S22 = 3'd7;
    reg [2:0] state, next;

    // State register
    always @(posedge clk) begin
        if (reset) state <= A;
        else state <= next;
    end

    // Next-state logic
    always @(*) begin
        case (state)
            A: next = s ? B : A;
            B: next = w ? S11 : S10;
            S10: next = w ? S21 : S20;
            S11: next = w ? S22 : S21;
            S20: next = B;
            S21: next = w ? C : B;
            S22: next = w ? B : C;
            C:  next = w ? S11 : S10;
            default: next = A;
        endcase
    end

    // output
    assign z = (state == C);

endmodule