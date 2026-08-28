module d_flip_flop(
    input clk, d, output reg q, output qbar
);
    // It will generate two different block
    // always @(posedge clk) begin
    //     q <= d;
    //     qbar <= ~d;
    // end


    always @(posedge clk) q <= d;
    assign qbar = ~q;
    
endmodule