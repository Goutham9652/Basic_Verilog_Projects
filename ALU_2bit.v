`timescale 1ns / 1ps


module ALU_2bit(
    input [3:0] a,b,
    input [2:0] op,
    output reg [7:0] x
    );
    always @(op)
     begin
        case(op)
            3'b000 : x <= a + b;
            3'b001 : x <= a - b;
            3'b010 : x <= a * b;
            3'b011 : x <= a|b;
            3'b100 : x <= a & b;
            3'b101 : x <= ~(a | b);
            3'b110 : x <= a ^ b;
            3'b111 : x <= ~a;
            default: x<=4'b0000;
        endcase
    end
endmodule

module ALU_2bit_tb;
   reg [3:0] a,b;
   reg [2:0] op;
   wire [7:0] x;
 
ALU_2bit uut(
    a,b,op,x
);
integer i;
 initial
   begin
    a=1011;
    b=1101;
    op=0;
    for(i=0;i<8;i=i+1)
       #10 op=i;
       
       $finish;
   end
endmodule
