`timescale 1ns / 1ps

module enco_8x3(
    input a,b,c,d,e,f,g,h,
    output [2:0] x
    );
    assign x[0]=b|d|f|h;
    assign x[1]=c|d|g|h;
    assign x[2]=e|f|g|h;
endmodule

module enco_tb;
    reg a,b,c,d,e,f,g,h;
    wire [2:0]x;
    
enco_8x3 uut(a,b,c,d,e,f,g,h,x);
    integer i;
    initial begin
   
        for(i=0;i<256;i=i+1)
            #10 {a,b,c,d,e,f,g,h}=i;
    end
    endmodule