`timescale 1ns / 1ps


module bus_arbiter(
    input Ra,Rb,clk,rst,
    output reg Ga,Gb
    );
    reg [1:0] state; 
    parameter idle = 2'b00;
    parameter GrantA = 2'b01;
    parameter GrantB = 2'b10;
    always @(posedge clk)
        begin
            if(rst==1'b1)
                state <= idle;
            else begin
                case(state)
                    idle: begin
                         Ga <= 0; Gb<=0;
                         if(Ra) state <= GrantA;
                         else if(Rb) state <= GrantB;
                         else state <= idle;
                    end
                    
                     GrantA: begin
                           Ga <= 1; Gb<=0;
                           if(Ra) state <= GrantA;
                           else if(Rb==1 && Ra==0) state <= GrantB;
                           else state <= idle;
                     end
                      GrantB: begin
                           Ga <= 0; Gb<=1;
                           if(Rb) state <= GrantB;
                           else if(Rb==0 && Ra==1) state <= GrantB;
                           else state <= idle;
                     end
                endcase
            end
        
        end
endmodule

module bus_arbiter_tb;
     reg Ra,Rb,clk,rst;
     wire Ga,Gb;
bus_arbiter uut(Ra,Rb,clk,rst,Ga,Gb);
initial clk=0;
always #10 clk=~clk;
initial begin
    rst=0;
    Ra=1; Rb=0; #20 Ra=0; Rb=1;
end
endmodule
