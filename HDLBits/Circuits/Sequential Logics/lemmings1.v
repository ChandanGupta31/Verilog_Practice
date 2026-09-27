// ==========================================
// Problem: Lemmings 1
// Link: https://hdlbits.01xz.net/wiki/Lemmings1
// ==========================================

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    // parameter LEFT=0, RIGHT=1, ...
    reg state, next_state;

    always @(*) begin
        case (state)
            1'b0 : next_state = bump_left ? 1'b1 : 1'b0;
            1'b1 : next_state = bump_right ? 1'b0 : 1'b1;
            default : next_state = 1'b0;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if (areset) state <= 1'b0;
        else state <= next_state;
    end

    // Output logic
    assign walk_left = state==1'b0;
    assign walk_right = state==1'b1;

endmodule
