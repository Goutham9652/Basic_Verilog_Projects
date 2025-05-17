`timescale 1ns / 1ps

module binary_gray(
    input [3:0] b,
    output [3:0] g
    );
    assign g[3]=b[3];
    assign g[2]=b[2]^b[3];
    assign g[1]=b[1]^b[2];
    assign g[0]=b[0]^b[1];
endmodule

module binary_graytb;
    reg [3:0] b;
    wire [3:0] g;
 binary_gray uut(b,g);
    initial begin
        b=4'b0011; #5 b=4'b0010; #5 b=4'b1001; #5 $finish;
    end
endmodule
