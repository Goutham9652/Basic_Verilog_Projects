`timescale 1ns / 1ps

module ripple_adder(
    input a0,a1,b0,b1,
    output s0,s1,s2
    );
    wire w0;
    ha_df h1(a0,b0,s0,w0);
    fa f2(a1,b1,w0,s1,s2);
endmodule

