// ==========================================
// Problem: Gshare
// Link: https://hdlbits.01xz.net/wiki/Cs450/gshare
// ==========================================

module top_module(
    input clk,
    input areset,

    input  predict_valid,
    input  [6:0] predict_pc,
    output predict_taken,
    output [6:0] predict_history,

    input train_valid,
    input train_taken,
    input train_mispredicted,
    input [6:0] train_history,
    input [6:0] train_pc
);
    reg [6:0] history;
    reg [1:0] pht [0:127];
    integer i;

    // Prediction
    assign predict_history = history;
    assign predict_taken = pht[predict_pc ^ history][1];

    // State updates
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            history <= 7'b0;
            for (i = 0; i < 128; i = i + 1)
                pht[i] <= 2'b01;
        end
        else begin
            if (train_valid && train_mispredicted) history <= {train_history[5:0], train_taken};
            else if (predict_valid) history <= {history[5:0], predict_taken};

            if (train_valid) begin
                if (train_taken) begin
                    if (pht[train_pc ^ train_history] != 2'b11) pht[train_pc ^ train_history] <= pht[train_pc ^ train_history] + 1'b1;
                end
                else begin
                    if (pht[train_pc ^ train_history] != 2'b00) pht[train_pc ^ train_history] <= pht[train_pc ^ train_history] - 1'b1;
                end
            end
        end
    end

endmodule
