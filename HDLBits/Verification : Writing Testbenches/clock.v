// ==========================================
// Problem: Testbench Clock
// Link: https://hdlbits.01xz.net/wiki/Tb/clock
// ==========================================


module top_module ( );
	reg c;
    dut uut(.clk(c));
    
    initial c = 1'b0;
    always #5 c = ~c;
endmodule
