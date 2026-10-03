// ==========================================
// Problem: Testbench TB2
// Link: https://hdlbits.01xz.net/wiki/Tb/tb2
// ==========================================

module top_module();
    reg clk_tb, in_tb;
    reg [2:0] s_tb;
    wire out_tb;
    
    q7 dut(.clk(clk_tb), .in(in_tb), .s(s_tb), .out(out_tb));
    
    initial begin
        clk_tb = 1'b0;
        in_tb = 1'b0;
        s_tb = 3'd2;
    end
    
    always #5 clk_tb = ~clk_tb;
	
    initial begin
        #10 s_tb = 3'd6;
        
        #10 s_tb = 3'd2;
        in_tb = 1'b1;
        
        #10 s_tb = 3'd7;
        in_tb = 1'b0;
        
        #10 s_tb = 3'd0;
        in_tb = 1'b1;
        
        #30 in_tb = 1'b0;
    end
    
endmodule
