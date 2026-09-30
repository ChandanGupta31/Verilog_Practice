// ==========================================
// Problem: 2's complement Mealy Machine
// Link: https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q5b
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
        if (areset) state <= idle;
        else state <= next;
    end
    
    assign z = state==start ? ~x : x;

endmodule
