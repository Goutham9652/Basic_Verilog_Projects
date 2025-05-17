`timescale 1ns / 1ps

module jk_dff(
    input d,clk,
    output q
    );
    top_module ff1(clk,d,~d,q);
endmodule

module jk_dff_tb;
    reg clk,d;
    wire q;
jk_dff uut(d,clk,q);
always #5 clk=~clk;
initial begin 
    clk=1;
   d=1; #10 d=0; #20 $finish;
end
endmodule

