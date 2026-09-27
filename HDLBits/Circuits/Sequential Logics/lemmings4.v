// ==========================================
// Problem: Lemmings 4
// Link: https://hdlbits.01xz.net/wiki/Lemmings4
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
    
    // parameters , states, and counter
    parameter left = 3'b000,
            right = 3'b001,
            fall_left = 3'b010,
            fall_right = 3'b011,
            dig_left = 3'b100,
            dig_right = 3'b101,
            splat = 3'b110;
	
    reg [2:0] state, next;
    reg [6:0] counter = 7'd0;		// taken extra bit if in case it run for too long
    
    // state transition logic
    always @(*) begin
        case(state)
            left : next = !ground ? fall_left : dig ? dig_left : bump_left ? right : left;
            right : next = !ground ? fall_right : dig ? dig_right : bump_right ? left : right;
            dig_left : next = !ground ? fall_left : dig_left;
            dig_right : next = !ground ? fall_right : dig_right;
            fall_left : next = (counter >= 5'd20 && ground) ? splat : ground ? left : fall_left;
            fall_right : next = (counter >= 5'd20 && ground) ? splat : ground ? right : fall_right;
            splat : next = splat;
            default : next = left;
        endcase
    end
    
    // state assigning
    always @(posedge clk, posedge areset) begin
        if (areset) begin 
            state <= left;
            counter <= 7'd0;
        end
        else begin     
            state <= next;
            
            if (state==fall_left || state==fall_right) counter <= counter + 1;
            else counter <= 7'd0;
        end
    end
    
    // output logic
    assign walk_left = state==left;
    assign walk_right = state==right;
    assign digging = state==dig_left || state==dig_right;
    assign aaah = state==fall_left || state==fall_right;
    
endmodule
