`timescale 1ns / 1ps


module dec_3x8(
    input [2:0] data_in,
    output reg [7:0] data_out
    );
 always @(data_in) begin
    case(data_in)
        3'b000 : data_out <= 8'b00000001;
        3'b001 : data_out <= 8'b00000010;
         3'b010 : data_out <= 8'b00000100;
         3'b011 : data_out <= 8'b00001000;
         3'b100 : data_out <= 8'b00010000;
         3'b101 : data_out <= 8'b00100000;
         3'b110 : data_out <= 8'b01000000;
         3'b111 : data_out <= 8'b10000000;
    endcase
 end
endmodule

module deco_tb;
     reg [2:0] data_in;
     wire [7:0] data_out;
dec_3x8 uut(data_in,data_out);
integer i;
initial begin
    data_in=3'b000;
    for(i=1;i<8;i=i+1)
        #10 data_in=i;
        $finish;
end
     endmodule