`timescale 1ns / 1ps

module mux_8x1(
    input [3:0] i0, i1, i2, i3, i4, i5, i6, i7,
    input [2:0] s,
    output reg [3:0] x
    
);

always @* begin
    case(s)
        3'b000: x <= i0;
        3'b001: x <= i1;
        3'b010: x <= i2;
        3'b011: x <= i3;
        3'b100: x <= i4;
        3'b101: x <= i5;
        3'b110: x <= i6;
        3'b111: x <= i7;
    endcase
end

endmodule

module mux_8x1_tb;
     reg i0, i1, i2, i3, i4, i5, i6, i7;
     reg [2:0] s;
     wire [3:0] x;
mux_8x1 uut(
    i0, i1, i2, i3, i4, i5, i6, i7,s,x
    
);
integer i;
initial
    begin
        for(i=0;i<1025;i=i+1)
         #10   {i0, i1, i2, i3, i4, i5, i6, i7,s} = i;
        end
    
endmodule    