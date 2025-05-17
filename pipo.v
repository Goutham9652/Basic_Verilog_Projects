`timescale 1ns / 1ps

module pipo(
    input clk,rst,
    input [3:0] p_in,
    output [3:0] p_out
    );
    reg [3:0] sr;
    always @(posedge clk)
    begin
    if(rst)
        sr<=4'b0000;
    else 
        sr<=p_in;
    end
    assign p_out=sr; 
endmodule

module pipo_tb;
    reg clk,rst;
    reg [3:0] p_in;
    wire [3:0] p_out;
pipo uut(clk,rst,p_in, p_out);
always #5 clk=~clk;
    initial begin
        clk=0; rst=1; p_in=4'b0000;
        #5  rst=0; p_in=4'b1100;
        #10 p_in=4'b0110;
        #10 p_in=4'b1011;
        #10 p_in=4'b0111; #10 $finish;
    end
endmodule
