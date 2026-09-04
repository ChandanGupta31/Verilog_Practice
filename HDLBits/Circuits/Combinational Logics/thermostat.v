// ==========================================
// Problem: Thermostat
// Link: https://hdlbits.01xz.net/wiki/Thermostat
// ==========================================

module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    assign aircon = {too_hot & {~mode}} ? 1'b1 : 1'b0;
    assign heater = {too_cold & mode} ? 1'b1 : 1'b0;
    assign fan = {fan_on | {too_hot & {~mode}} | {too_cold & mode}} ? 1'b1 :1'b0;

endmodule
