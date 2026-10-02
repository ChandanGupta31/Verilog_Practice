// ==========================================
// Problem: Fancy Timer
// Link: https://hdlbits.01xz.net/wiki/Exams/review2015_fancytimer
// ==========================================

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output reg [3:0] count,
    output counting,
    output done,
    input ack );
    
    parameter A = 4'd0, B = 4'd1, C = 4'd2, D = 4'd3, E1 = 4'd4, E2 = 4'd5, E3 = 4'd6, E4 = 4'd7, F = 4'd8, G = 4'd9;
    reg [3:0] state, next;
    reg [9:0] counter;
    
    always @(*) begin
        case (state)
            A : next = data ? B : A;
            B : next = data ? C : A;
            C : next = data ? C : D;
            D : next = data ? E1 : A;
            E1 : next = E2;
            E2 : next = E3;
            E3 : next = E4;
            E4 : next = F;
            F : next = counter==10'd999 && count==4'd0 ? G : F;
            G : next = ack ? A : G;
            default : next = A;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) state <= A;
        else state <= next;
    end
    
    always @(posedge clk) begin
        if (reset) begin
            count <= 4'd0;
            counter <= 10'd0;
        end
        else begin
            if (state==E1 || state==E2 || state==E3 || state==E4) count <= {count[2:0], data};
            else if(state==F) begin
                if (counter == 10'd999) begin
                    counter <= 10'd0;
                    count <= count -1'b1;
                end
                else counter <= counter + 1'b1;
            end
            else begin
            	count <= 4'd0;
            	counter <= 10'd0;
        	end
        end
    end
    
    assign counting = state==F;
   	assign done = state==G;

endmodule
