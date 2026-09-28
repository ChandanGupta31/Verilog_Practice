// ==========================================
// Problem: FSM Serial
// Link: https://hdlbits.01xz.net/wiki/Fsm_serial
// ==========================================

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter idle = 2'b00, start = 2'b01, stop_data = 2'b10, stop = 2'b11;
    reg [1:0] state, next;
    reg [5:0] counter;
    
    always @(*) begin
        case (state)
            idle : next = in ? idle : start;
            start : next = (in==1 && counter == 6'd8) ? stop_data : (in==1 & counter > 6'd8) ? stop : start;
            stop_data : next = in ? idle : start;
            stop : next = in ? idle : start;
            default : next = idle;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin
            state <= idle;
            counter <= 0;
        end
        else begin 
            state <= next;
        	if (state== start) counter <= counter + 1;
            else counter <= 0;
        end
    end
    
    assign done = state==stop_data;

endmodule
