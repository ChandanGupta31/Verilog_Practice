// ==========================================
// Problem: Popcount255
// Link: https://hdlbits.01xz.net/wiki/Popcount255
// ==========================================

module top_module( 
    input [254:0] in,
    output [7:0] out );
    reg [7:0]counter;
    integer i = 0;
    
    always @(*) begin
        counter = 8'b0;
        for(i=0; i<255; i = i+1) begin
            if (in[i]==1'b1) counter = counter+1'b1;
        end
    end
    
    assign out = counter;
endmodule
