`timescale 1ns / 1ps


module counter_3bit(
    input clk,rst,
    output reg [2:0] count
    );
    initial count=3'b000;
  always @(posedge clk)
  begin
    if(rst)
        count <= 3'b000;
    else
        count <=count+1;
    
  end
endmodule

module counter_tb;
    reg clk,rst;
    wire [2:0] count;
 counter_3bit uut(clk,rst,count);
    always #5 clk=~clk;
    initial begin
        clk=0; rst=1; #5
        rst=0; #80 $finish;
    end
endmodule