// ==========================================
// Problem: Complete FSM
// Link: https://hdlbits.01xz.net/wiki/Exams/review2015_fsm
// ==========================================

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    parameter A = 4'd0, B = 4'd1, C = 4'd2, D = 4'd3, E1 = 4'd4, E2 = 4'd5, E3 = 4'd6, E4 = 4'd7, F = 4'd8, G = 4'd9;
    reg [3:0] state, next;
    
    always @(*) begin
        case (state)
            A : next = data ? B : A;
            B : next = data ? C : A;
            C : next = data ? C : D;
            D : next = data ? E1 : A;
            E1 : next = E2;
            E2 : next = E3;
            E3 : next = E4;
            E4 : next = F;
            F : next = done_counting ? G : F;
            G : next = ack ? A : G;
            default : next = A;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) state <= A;
        else state <= next;
    end
    
    assign shift_ena = state==E1 || state==E2 || state==E3 || state==E4;
    assign counting = state==F;
    assign done = state==G;

endmodule
