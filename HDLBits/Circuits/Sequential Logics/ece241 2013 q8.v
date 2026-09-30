// ==========================================
// Problem: Design a Mealy Circuit
// Link: https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q8
// ==========================================

module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter idle = 2'd0, s1 = 2'd1, s2 = 2'd2;
    reg[1:0] state, next;
    
    always @(*) begin
        case(state)
            idle : next = x ? s1 : idle;
            s1 : next = x ? s1 : s2;
            s2 : next = x ? s1 : idle;
            default : next = idle;
        endcase
    end
    
    always @(posedge clk, negedge aresetn) begin
        if (!aresetn) state <= idle;
        else state <= next;
    end
    
    assign z = state==s2 && x;

endmodule
