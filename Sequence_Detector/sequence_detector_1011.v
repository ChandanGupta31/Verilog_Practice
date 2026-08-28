module sequence_detector_1011 (
    input clk, din, rst,
    output reg out
);

    // State Variable declaration
    reg [2:0] present, next;

    // State Parameters
    parameter S0 = 3'b000,
            S1 = 3'b001,
            S2 = 3'b010,
            S3 = 3'b011,
            S4 = 3'b100;

    // State Memory
    always @(posedge clk) begin
        if (rst) present <= S0;
        else present <= next;
    end

    // Next State Logic
    always @(*) begin
        next = present;

        case (present)
            S0 : next = din ? S1 : S0;
            S1 : next = din ? S1 : S2;
            S2 : next = din ? S3 : S0;
            S3 : next = din ? S4 : S2;
            S4 : next = din ? S1 : S2;
            default: next = S0;
        endcase
    end

    // Output Logic
    always @(*) begin
        if (present == S4)  out = 1'b1;
        else out = 1'b0;
    end
    
endmodule