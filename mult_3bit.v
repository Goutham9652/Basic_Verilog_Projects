`timescale 1ns / 1ps

module mult_3bit(
    input [2:0] a,b,
    output [5:0] x
    );
    wire w0,w1,w2,w3,w4,w5,w6,w7,w8,s0,s1,s2,s3,s4,s5;
and g1(w8,a[0],b[0]);   
and g2(w0,a[1],b[0]);
and g3(w1,a[0],b[1]);
and g4(w2,a[2],b[0]);
and g5(w3,a[1],b[1]);
and g6(w4,a[0],b[2]);
and g7(w5,a[2],b[1]);
and g8(w6,a[1],b[2]);
and g9(w7,a[2],b[2]);

ripple_adder r1(w8,w0,w2,0,0,0,w1,w3,w5,0,s0,s1,s2,s3,s4,s5);
ripple_adder r2(0,0,w4,w6,w7,s0,s1,s2,s3,s4,x[0],x[1],x[2],x[3],x[4],x[5]);
endmodule
///////////////////////////////////////////////////////////////////////////



module mult_3bit_tb;
    reg [2:0] a,b;
    wire [5:0] x;
    mult_3bit uut(.a(a), 
                  .b(b),
                  .x(x)
                  );
    integer i;
    initial 
    begin
    for(i=0;i<64;i=i+1)
       #1 {a,b}=i;
    end
   
endmodule