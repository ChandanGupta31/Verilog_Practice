// ==========================================
// Problem: 2's Complement Moore Machine
// Link: https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q5a
// ==========================================

module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter idle = 1'b0, start = 1'b1;
    reg state, next;
    
    always @(*) begin
        case(state)
            idle : next = x ? start : idle;
            start : next = start;
            default : next = idle;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if(areset) begin
            state <= idle;
            z <= 0;
        end
        else begin
            state <= next;
            z <= state==start ? ~x : x;
        end
    end
    
    

endmodule
