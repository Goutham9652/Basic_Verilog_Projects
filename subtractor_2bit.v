`timescale 1ns / 1ps

module subtractor_2bit(
    input a,b,
    output sub,borrow
    );
    assign sub= a^b;
    assign borrow=(~a)&b;
endmodule

module sub_tb;
    reg  a,b;
    wire sub,borrow;
subtractor_2bit uut(a,b,sub,borrow);
    integer i;
  initial begin
    for(i=0;i<5;i=i+1)
      #10  {a,b}=i;
      end
endmodule