// ==========================================
// Problem: Q2A FSM
// Link: https://hdlbits.01xz.net/wiki/Exams/2013_q2afsm
// ==========================================

module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter A = 2'd0, B = 2'd1, C = 2'd2, D = 2'd3;
    reg [1:0] state, next;
    
    always @(*) begin
        case (state)
            A : begin
                if (r[1]) next = B;
                else if (r[2]) next = C;
                else if (r[3]) next = D;
                else next = A;
            end
            B : next = r[1] ? B : A;
            C : next = r[2] ? C : A;
            D : next = r[3] ? D : A;
            default : next = A;
        endcase
    end
    
    always @(posedge clk) begin
        if (!resetn) state <= A;
        else state <= next;
    end
    
    assign g = {state==D, state==C, state==B};

endmodule
