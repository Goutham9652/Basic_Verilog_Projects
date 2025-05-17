`timescale 1ns / 1ps

module siso(
    input clk,rst,s_in,
    output s_out
    );
    reg [3:0]sr;
 always @(posedge clk or posedge rst)
 begin
    if(rst)
        sr <= 4'b0000;
    else 
        sr<={s_in,sr[3:1]};
 end
    assign s_out = sr[0]; 
endmodule

module siso_tb;
    reg clk,rst,s_in;
    wire s_out;
        siso uut(clk,rst,s_in,s_out);
    always #5 clk=~clk;
    initial begin
        clk=0; rst=1;
        #5 rst=0;
        s_in = 1;
        #10 s_in = 0;
        #10 s_in =1;
        #10 s_in =0; #100 $finish;
    end
endmodule