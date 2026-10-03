// ==========================================
// Problem: Testbench Andgate
// Link: https://hdlbits.01xz.net/wiki/Tb/and
// ==========================================

module top_module();
    reg [1:0] in;
    wire out;

    andgate dut(.in(in), .out(out));
    
    initial begin
        in = 2'd0;
        
        #10 in = 2'd1;
        #10 in = 2'd2;
        #10 in = 2'd3;
    end
    
endmodule

