// ==========================================
// Problem: Counter 2BC
// Link: https://hdlbits.01xz.net/wiki/Cs450/counter_2bc
// ==========================================

module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output reg [1:0] state
);
    
    always @(posedge clk, posedge areset) begin
        if (areset) state <= 2'b01;
        else if (train_valid) begin
            if(train_taken && state < 2'b11) state <= state + 1'b1;
            else if(!train_taken && state > 2'b00) state <= state - 1'b1;
            else state <= state;
        end
        else state <= state;
    end

endmodule
