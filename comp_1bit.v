`timescale 1ns / 1ps

module comp_1bit(
    input a,b,
    output l,g,e
    );
    assign e= ~(a^b);
    assign l=(~a & b);
    assign g=(a & ~b);
endmodule

module comp_tb;
    reg a,b;
    wire l,g,e;
comp_1bit uut(a,b,l,g,e);

initial begin
   a=0; b=0; #10
    a=0; b=1; #10
     a=1; b=0; #10
      a=1; b=1; #10
         $finish;
end
endmodule
