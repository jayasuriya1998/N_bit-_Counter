`timescale 1ns / 1ps


module counter #(parameter N=8)
(
    input logic clk,rct,incr,
    output logic [N-1:0] count_reg
);
always_ff @(posedge clk)begin
    if      (rct)  count_reg <= 0 ;                   //Asynchronouse Reset with Priority Encoder
    else if (incr) count_reg <= count_reg + 1'b1 ;    //If not reset high increment by one
end
endmodule
