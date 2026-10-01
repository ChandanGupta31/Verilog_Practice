// ==========================================
// Problem: Q3c FSM
// Link: https://hdlbits.01xz.net/wiki/Exams/2014_q3c
// ==========================================

module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    parameter A = 3'd0, B = 3'd1, C = 3'd2, D = 3'd3, E = 3'd4;
    reg [2:0] next;
    always @(*) begin
        case(y)
            A : next = x ? B : A;
            B : next = x ? E : B;
            C : next = x ? B : C;
            D : next = x ? C : B;
            E : next = x ? E : D;
            default : next = A;
        endcase
    end
    assign Y0 = next[0];
    assign z = y==D|| y==E;
endmodule
