module FA_task(
    input a, b, cin,
    output reg sum, carry
);

    reg s1, c1, w;

    task HA;
        input a, b;
        output sum, carry;
        begin
            sum = a ^ b;
            carry = a & b;
        end
    endtask
    
   always @* begin
        HA(a, b, s1, c1);
        HA(s1, cin, sum, w);
        carry = c1 | w;
    end 

endmodule

module FA_task_tb;
    reg a, b, cin;
    wire sum, carry;

    FA_task uut(a, b, cin, sum, carry);

    integer i;

    initial begin 
        for (i = 0; i <= 7; i = i + 1) begin
            #10;
            {a, b, cin} = i;
        end
    end
endmodule
