module d_flip_flop_tb();
    reg clk, d;
    wire q, qbar;

    d_flip_flop dut(
        .clk(clk),
        .d(d),
        .q(q),
        .qbar(qbar)
    );

    initial begin
        clk = 0;
    end
    always #5 clk = ~clk;

    initial begin
        #5 d = 1;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        $finish;
    end
endmodule