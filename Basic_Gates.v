`timescale 1ns / 1ps

module Basic_Gates(
    input a,b,
    output result_AND,result_OR,result_XOR,result_NOT,result_NAND,result_NOR,result_XNOR,result_BUFF
    );
    assign result_AND = a&b;
    assign result_OR = a|b;
    assign result_XOR = a^b;
    assign result_NOT = ~a;
    not g1(result_XNOR,result_XOR);
    not g2(result_NAND,result_AND);
    not g3(result_NOR,result_OR);
    buf g4(result_BUFF,a);
    
endmodule

module basic_gates_tb;
    reg a,b;
    wire result_AND,result_OR,result_XOR,result_NOT,result_NAND,result_NOR,result_XNOR,result_BUFF;
Basic_Gates uut( a,b,
         result_AND,result_OR,result_XOR,result_NOT,result_NAND,result_NOR,result_XNOR,result_BUFF
        );
 integer i;
 initial begin
    for(i=0;i<4;i=i+1)
       #10  {a,b}=i;
       #10 $finish;
 end
endmodule