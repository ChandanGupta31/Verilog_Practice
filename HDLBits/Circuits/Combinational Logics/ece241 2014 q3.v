// ==========================================
// Problem: K Map
// Link: https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q3
// ==========================================

module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    assign mux_in = {c&d, ~d, ~c&c, c|d};

endmodule
