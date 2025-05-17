module fa(input a,b,cin, output s,cout );
    assign s=a^b^cin;
    assign cout=(a&b)|(b&cin)|(cin&a);
endmodule

module adder_2bit(
    input [1:0] a, b,
    output [2:0] sum
);
    wire c;
    fa fa1(a[0], b[0], 1'b0, sum[0], c);
    fa fa2(a[1], b[1], c, sum[1], sum[2]);
endmodule

module adder_2bit_tb;
    reg [1:0] a,b;
    wire [2:0] sum;
adder_2bit uut(a,b,sum);
integer i;
initial begin
    for(i=0;i<16;i=i+1)
        #10 {a,b}=i;
        #10 $finish;
end
endmodule