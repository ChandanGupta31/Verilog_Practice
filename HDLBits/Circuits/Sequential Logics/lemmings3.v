// ==========================================
// Problem: Lemmings 3
// Link: https://hdlbits.01xz.net/wiki/Lemmings3
// ==========================================

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter left = 3'b000,
            right = 3'b001,
            fall_left = 3'b010, 
            fall_right = 3'b011, 
            dig_left = 3'b100, 
            dig_right = 3'b101;
    
    reg [2:0] state, next;
    
    always @(*) begin
        case(state)
            left : next = !ground ? fall_left : dig ? dig_left : bump_left ? right : left;
            right : next = !ground ? fall_right : dig ? dig_right : bump_right ? left : right;
            fall_left : next = ground ? left : fall_left;
            fall_right : next = ground ? right : fall_right;
            dig_left : next = !ground ? fall_left : dig_left;
            dig_right : next = !ground ? fall_right : dig_right;
            default : next = left;
        endcase
    end
    
    always @(posedge clk, posedge areset) begin
        if (areset) state <= left;
        else state <= next;
    end
    
    assign walk_left = state==left;
    assign walk_right = state==right;
    assign aaah = state==fall_left || state==fall_right;
    assign digging = state==dig_left || state==dig_right;

endmodule
