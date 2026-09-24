// ==========================================
// Problem: Counter
// Link: https://logi-code.com/challenge/counter-verilog-sequential-easy-interview-questions
// ==========================================

module counter #(
    parameter MAX        = 99,
    parameter DATA_WIDTH = 16
) (
    input  logic                  clk,
    input  logic                  reset,
    input  logic                  start,
    input  logic                  stop,
    output logic [DATA_WIDTH-1:0] count
);
  bit lastState = 1'b0;
  always_ff @(posedge clk) begin
    if (reset) begin
      count <= 16'b0;
      lastState <= 1'b0;
    end
    else if(stop) lastState <= 1'b0;
    else if(start) begin
      lastState <= 1'b1;
      count <= count + 1'b1;
    end
    else begin
      if (lastState) begin
        if(count==MAX) count <= 16'b0;
        else count <= count + 1'b1;
      end
      else count <= count;
    end
  end
endmodule