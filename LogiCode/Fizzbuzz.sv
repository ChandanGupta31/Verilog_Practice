// ==========================================
// Problem: Fizzbuzz
// Link: https://logi-code.com/challenge/fizzbuzz-verilog-sequential-easy-interview-questions
// ==========================================

module fizzbuzz #(
    parameter FIZZ       = 3,
    parameter BUZZ       = 5,
    parameter MAX_CYCLES = 100
) (
    input  logic clk,
    input  logic resetn,
    output logic fizz,
    output logic buzz,
    output logic fizzbuzz
);
  integer i=0;
  always @(posedge clk) begin
    if (~resetn | i==MAX_CYCLES) i = 0;
    else i=i+1;

    if(i%FIZZ==0) fizz <= 1;
    else fizz <= 0;
    if(i%BUZZ==0) buzz <= 1;
    else buzz <= 0;
    if(i%FIZZ==0 & i%BUZZ==0) fizzbuzz <= 1;
    else fizzbuzz <= 0;
  end
endmodule