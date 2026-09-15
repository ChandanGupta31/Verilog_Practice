module RAM8_8_TB(); 

    // Inputs to the DUT
    reg clk;
    reg rst;
    reg w_enb; 
    reg [2:0] w_addr;
    reg [2:0] rd_addr; 
    reg [7:0] data_in; 
    
    // Outputs from the DUT
    wire [7:0] data_out; 

    // Instantiate the Design Under Test (DUT)
    RAM8_8 dut (
        .clk(clk), 
        .rst(rst), 
        .w_enb(w_enb), 
        .w_addr(w_addr), 
        .rd_addr(rd_addr), 
        .data_in(data_in), 
        .data_out(data_out)
    ); 

    // Clock generation (10ns period)
    initial begin 
        clk = 0; 
    end 
    always #5 clk = ~clk; 

    // Stimulus generation
    initial begin 
        // Initialize inputs and apply reset
        rst = 1; 
        w_enb = 0;
        w_addr = 0;
        rd_addr = 0;
        data_in = 0;
        
        #10; 
        rst = 0; 
        
        // Write Operation 1: Write to address 3'b010
        #10;
        w_enb = 1; 
        w_addr = 3'b010; 
        data_in = 8'b1010_1010; 
        
        // Write Operation 2: Write to address 3'b101
        #10; 
        w_addr = 3'b101; 
        data_in = 8'b0100_1001; 
        
        // Read Operation: Disable write and read from address 3'b101
        #10; 
        w_enb = 0; 
        rd_addr = 3'b101; 
        
        // Let the read operation stabilize, then finish simulation
        #10; 
        $finish; 
    end 
endmodule
