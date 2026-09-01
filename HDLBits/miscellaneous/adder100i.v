// ==========================================
// Problem: Adder100i
// Link: https://hdlbits.01xz.net/wiki/Adder100i
// ==========================================

module top_module( 
    input [99:0] a, b,
    input cin,
    output reg [99:0] cout,
    output reg [99:0] sum );
    
    integer i = 0;
   
    always @(*) begin
        cout = 100'b0;
        sum = 100'b0;
        for (i=0; i<100; i=i+1) begin
            if (i==0) {cout[0], sum[0]} = a[0] + b[0] + cin;
            else {cout[i], sum[i]} = a[i] + b[i] + cout[i-1];
        end
    end

endmodule
