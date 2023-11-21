`timescale 1ns / 1ps

module counter_tb();
timeunit 1ns;
timeprecision 1ps;

logic clk;
localparam CLK_PERIOD =10;
initial begin
    clk = 0 ;
    forever #(CLK_PERIOD/2) clk <= ~clk;
end

localparam WIDTH=8;
logic rct,incr;
logic [WIDTH-1:0] count_reg;

counter #(.WIDTH(WIDTH)) dut (.*);

initial begin
    #(CLK_PERIOD * 2);
    
    @(posedge clk);
    rct <= 1;
    
    #(CLK_PERIOD * 2);
    @(posedge clk);
    incr <= 1;
    
    @(posedge clk);
    rct  <= 0;
    incr <= 1;
    
    #(CLK_PERIOD * 4);
    @(posedge clk);
    incr <= 0;
    
    #(CLK_PERIOD * 2);
    @(posedge clk);
    rct <= 1;
end
endmodule
