//////////////////////////////////////////////////////////////////////////////////////
 
  `timescale 1ns / 1ps
  
  module multipler(
      input [1:0] a,b,
      output [3:0] s
      );
      wire w0,w1,w2,w3;
      and q(s[0],a[0],b[0]);
      and e(w0,a[1],b[0]);
      and r(w1,a[0],b[1]);
      and y(w3,a[1],b[1]);
      ha_df u(w0,w1,s[1],w2);
      ha_df i(w2,w3,s[2],s[3]);
  endmodule
  
  `timescale 1ns / 1ps
  
  module multipler_tb;
      reg [1:0] a,b;
      wire [3:0] s;
    multipler uut(
          .a(a),
          .b(b),
          .s(s)
   );
   integer i;
   initial 
    begin
        for(i=0;i<=15;i=i+1)
            begin
             #10; {a,b}=i;
            end
       $finish;
    end
   endmodule