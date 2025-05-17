`timescale 1ns / 1ps

module dff(
    input  clk,d,
    output reg q
    );
    always @(posedge clk) begin
        q <= d;
    end
endmodule

module dff_tb;
    reg clk,d;
    wire q;
dff uut(clk,d,q);
always #5 clk=~clk;
initial begin 
    clk=1;
   d=1; #10 d=0; #20 $finish;
end
endmodule

