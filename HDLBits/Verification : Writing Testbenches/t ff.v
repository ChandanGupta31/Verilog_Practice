// ==========================================
// Problem: Testbench T FF
// Link: https://hdlbits.01xz.net/wiki/Tb/tff
// ==========================================

module top_module ();
	reg clk_tb, reset_tb, t_tb;
    wire q_tb;
    
    tff dut(.clk(clk_tb), .reset(reset_tb), .t(t_tb), .q(q_tb));
    
    initial begin
		clk_tb   = 1'b0;
        reset_tb = 1'b1;
        t_tb     = 1'b0;

        @(negedge clk_tb);
        reset_tb = 1'b0;
        t_tb     = 1'b1;

        @(negedge clk_tb);
        $finish;
    end
    
    always #5 clk_tb = ~clk_tb;
    
endmodule

