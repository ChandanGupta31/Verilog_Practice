// ==========================================
// Problem: Design a Moore FSM
// Link: https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q4
// ==========================================

module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E=3'b100, F=3'b101;
    reg [2:0] state, next;
    
    // state switch logic
    always @(*) begin
        case (state)
            A : next = s==3'b001 ? B : A;
            B : next = s==3'b000 ? A : s==3'b011 ? C : B;
            C : next = s==3'b001 ? F : s==3'b111 ? D : C;
            D : next = s==3'b011 ? E : D;
            E : next = s==3'b111 ? D : s==3'b001 ? F : E;
            F : next = s==3'b000 ? A : s==3'b011 ? C : F;
            default: next = A;
        endcase
    end
    
    // state assign logic
    always @(posedge clk) begin
        if (reset) state <= A;
        else state <= next;
    end
    
    // output logic
    assign dfr = (state==E) || (state==A) || (state==F);
    assign fr1 = (state != D);
    assign fr2 = (state != C) && (state != E) && (state != D);
    assign fr3 = (state == A);
endmodule
