
module sd1011_mealy(input clk,
                   input reset,
                   input din,
                   output reg dout);

reg [2:0] state;
                     parameter S0 = 2'b00;
                     parameter S1 = 2'b01;
                     parameter S2 = 2'b10;
                     parameter S3 = 2'b11;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      dout <= 1'b0;
      state <= S0;
    end
    else begin
      case(state)
        S0: begin
          if(din) begin
            state <= S1;
            dout <=1'b0;
          end
          else
            dout <=1'b0;
        end
        S1: begin
          if(~din) begin
            state <= S2;
            dout <=1'b0;
          end
          else begin
            dout <=1'b0;
          end
        end
        S2: begin
          if(~din) begin
            state <= S0;
            dout <=1'b0;
          end
          else begin
            state <= S3;
            dout <=1'b0;
          end
        end
        S3: begin
          if(din) begin
            state <= S0;
            dout <=1'b1;
          end
          else begin
            state <= S2;
            dout <=1'b0;
          end
        end
      endcase
    end
  end

endmodule

`timescale 1ns / 1ps

module sd1011_mealy_tb;

    // Inputs
    reg clk = 0;
    reg reset = 0;
    reg din = 0;

    // Outputs
    wire dout;

    // Instantiate the module under test
    sd1011_mealy uut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Reset generation
    initial begin
        reset = 1;
        #10;
        reset = 0;
    end

    // Test vectors
    initial begin
        // Test case 1
        $display("Test case 1:");
        din = 0;
        #10;
        din = 1;
        #10;
        din = 0;
        #10;

        // Test case 2
        $display("Test case 2:");
        din = 1;
        #10;
        din = 0;
        #10;
        din = 1;
        #10;
        din = 1;
        #10;

        // Add more test cases as needed
        // Make sure to give enough time for the simulation to complete
        #100;
        $finish;
    end

endmodule
