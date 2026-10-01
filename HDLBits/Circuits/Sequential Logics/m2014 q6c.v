// ==========================================
// Problem: Q6C FSM
// Link: https://hdlbits.01xz.net/wiki/Exams/2014_q6c
// ==========================================

module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    
    parameter A = 6'd1, B = 6'd2, C = 6'd4, D = 6'd8, E = 6'd16, F = 6'd32;
    reg [6:1] next;
    
    always @(*) begin
        case(1'b1)
            y[1] : next = w ? A : B;
            y[2] : next = w ? D : C;
            y[3] : next = w ? D : E;
            y[4] : next = w ? A : F;
            y[5] : next = w ? D : E;
            y[6] : next = w ? D : C;
            default : next = A;
        endcase
    end
    
    assign Y2 = next[2];
    assign Y4 = next[4];

endmodule
