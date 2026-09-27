// ==========================================
// Problem: Lemmings 2
// Link: https://hdlbits.01xz.net/wiki/Lemmings2
// ==========================================

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter left = 2'b00, right = 2'b01, fall_left = 2'b10, fall_right = 2'b11;
    reg [1:0] state, next;
    
    // state transition
    always @(*) begin
        case(state)
            left : next = !ground ? fall_left : bump_left ? right : left;
            right : next = !ground ? fall_right : bump_right ? left : right;
            fall_left : next = ground ? left : fall_left;
            fall_right : next = ground ? right : fall_right;
            default : next = left;
        endcase
    end
    
    // state assignment
    always @(posedge clk, posedge areset) begin
        if(areset) state <= left;
        else state <= next;
    end
    
    // output logic
    assign walk_left = state==left;
    assign walk_right = state==right;
    assign aaah = (state==fall_left) || (state==fall_right);

endmodule
