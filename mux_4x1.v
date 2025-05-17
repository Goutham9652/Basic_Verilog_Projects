`timescale 1ns / 1ps

module mux_4x1(
    output i0,i1,i2,i3,
    input x,a,b
    );
   assign i0= ~a & ~b & x;
   assign i1= ~a & b & x;
   assign i2= a & ~b & x;
   assign i3= a & b & x;
   
endmodule

module tb;
    wire i0,i1,i2,i3;
    reg x,a,b;
mux_4x1 uut(i0,i1,i2,i3,x,a,b);

initial begin
    x=1'b1;
   a=0; b=0; #10
    a=0; b=1; #10
     a=1; b=0; #10
      a=1; b=1; #10
         $finish;
end
endmodule
