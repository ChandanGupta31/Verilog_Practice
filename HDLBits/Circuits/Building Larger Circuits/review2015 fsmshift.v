// ==========================================
// Problem: FSM Shift Enable
// Link: https://hdlbits.01xz.net/wiki/Exams/review2015_fsmshift
// ==========================================

module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    parameter A = 3'd0, B = 3'd1, C = 3'd2, D = 3'd3, E = 3'd4, F = 3'd5;
    reg [2:0] state, next;
    
    always @(*) begin
        case (state)
            A : next = B;
            B : next = C;
            C : next = D;
            D : next = E;
            E : next = F;
            F : next = F;
            default : next = F;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) state <= A;
        else state <= next;
    end
    
    assign shift_ena = next != A && next != F;
endmodule
