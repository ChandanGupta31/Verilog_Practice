// ==========================================
// Problem: Polynomial 1
// Link: https://logi-code.com/challenge/polynomial-1-verilog-combinational-easy-interview-questions
// ==========================================

module polynomial_1 (
    input  logic signed [7:0]  x,
    output logic signed [15:0] y
);
  assign y = (x**2) + (2*x) + 1;
endmodule