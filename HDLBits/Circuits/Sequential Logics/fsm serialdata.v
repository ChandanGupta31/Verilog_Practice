// ==========================================
// Problem: FSM Serial Data
// Link: https://hdlbits.01xz.net/wiki/Fsm_serialdata
// ==========================================

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg [7:0] out_byte,
    output done
);

    parameter IDLE      = 3'd0,
              START     = 3'd1,
              DATA       = 3'd2,
              STOP      = 3'd3,
              ERROR     = 3'd4;

    reg [2:0] state, next;
    reg [3:0] counter;

    always @(*) begin

        case (state)
            IDLE: next = in ? IDLE : START;
            START: next = DATA;
            DATA: next = (counter==4'd8 && in) ? STOP : (counter>4'd8 && in) ? ERROR : DATA;
            STOP: next = in ? IDLE : START;
            ERROR: next = in ? IDLE : START;
            default: next = IDLE;

        endcase
    end

    always @(posedge clk) begin
        if (reset) state <= IDLE;
        else state <= next;
    end

    always @(posedge clk) begin
        if (reset) begin
            counter <= 4'd0;
            out_byte <= 8'd0;
        end
        else begin
            if (next == DATA) begin
                counter <= counter + 1'b1;
                out_byte <= {in, out_byte[7:1]};
            end
            else counter <= 4'd0;
        end
    end
    assign done = (state == STOP);

endmodule