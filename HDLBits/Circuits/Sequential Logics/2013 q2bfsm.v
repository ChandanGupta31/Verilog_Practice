// ==========================================
// Problem: Q2B FSM
// Link: https://hdlbits.01xz.net/wiki/Exams/2013_q2bfsm
// ==========================================

module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter A = 4'd0, B = 4'd1, C = 4'd2, D1 = 4'd3, D2 = 4'd4, D3 = 4'd5, E0 = 4'd6, E1 = 4'd7, E01 = 4'd8, E00 = 4'd9;
    reg [3:0] state, next;
    
    always @(*) begin
        case (state)
            A : next = resetn? B : A;
            B : next = C;
            C : next = x ? D1 : C;
            D1 : next = x ? D1 : D2;
            D2 : next = x ? D3 : C;
            D3 : next = y ? E1 : E0;
            E0 : next = y ? E01 : E00;
            E1 : next = E1;
            E01 : next = E01;
            E00 : next = E00;
            default : next = A;
        endcase
    end
    
    always @(posedge clk) begin
        if (!resetn) state <= A;
        else state <= next;
    end
    
    assign f = state==B;
    assign g = state==D3 || state==E0 || state==E1 || state==E01;

endmodule
