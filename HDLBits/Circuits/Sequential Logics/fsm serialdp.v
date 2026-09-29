// ==========================================
// Problem: FSM Serial Data Parity
// Link: https://hdlbits.01xz.net/wiki/Fsm_serialdp
// ==========================================

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
    
    parameter idle = 3'd0, start = 3'd1, data = 3'd2, stop = 3'd3, error = 3'd4;
    reg [4:0] counter;
    reg [2:0] state, next;
    reg [8:0] incoming_data;
    reg p;
    
    parity instance1(clk, reset || state==idle || state==stop || state==error, next==data ? in : 1'b0, p);
    
    always @(*) begin
        case (state)
            idle : next = in ? idle : start;
            start : next = data;
            data : next = in && counter==5'd9 ? stop : in && counter>5'd9 ? error : data;
            stop : next = in ? idle : start;
            error : next = in ? idle : start;
            default : next = idle;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) state <= idle;
        else state <= next;
    end
	
    always @(posedge clk) begin
        if (reset) begin
            counter <= 5'd0;
            incoming_data <= 9'd0;
        end
        else begin
            if (next==data) begin
                counter <= counter + 1'b1;
                incoming_data <= {in, incoming_data[8:1]};
            end
            else begin 
                counter <= 5'd0;
            end
        end
    end

    assign done = state==stop && p;
    assign out_byte = incoming_data[7:0];

endmodule
