// ==========================================
// Problem: FSM 1s
// Link: https://hdlbits.01xz.net/wiki/Fsm1s
// ==========================================

module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;

	parameter A=1'b0, B=1'b1;
    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) present_state <= B;
        else present_state <= next_state;
    end
    
    always @(*) begin
        case (present_state)
            A : next_state = in ? A : B;
            B : next_state = in ? B : A;
            default : next_state = B;
        endcase
    end

    assign out = present_state;
endmodule
