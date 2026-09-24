// ==========================================
// Problem: Conway Life
// Link: https://hdlbits.01xz.net/wiki/conwaylife
// ==========================================

module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q ); 
    
    integer row, col, up, down, left, right, count;
    reg [255:0] next;
    
    // logic for next state
    always @(*) begin
        for (row=0; row<16; row=row+1) begin
            for (col=0; col<16; col=col+1) begin
                // getting the indexes
                if(row==0) up=15;
                else up=row-1;
                
                if(row==15) down=0;
                else down=row+1;
                
                if(col==0) left=15;
                else left=col-1;
                
                if(col==15) right=0;
                else right=col+1;
                    
                // counting total sum
                count = q[up*16 + left]
                      + q[up*16 + col]
                      + q[up*16 + right]
                      + q[row*16 + left]
                      + q[row*16 + right]
                      + q[down*16 + left]
                      + q[down*16 + col]
                      + q[down*16 + right];
                
                // assigning values for next state
                if(count==3) next[16*row+col] = 1'b1;
                else if(count==2) next[16*row+col] = q[16*row+col];
                else next[16*row+col] = 1'b0;
            end
        end
    end
    
    // assignment of next state
    always @(posedge clk) begin
        if(load) q <= data;
        else q <= next;
    end

endmodule
