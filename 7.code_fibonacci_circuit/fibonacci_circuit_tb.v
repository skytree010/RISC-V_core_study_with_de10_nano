`timescale 1ns/100ps

module fibonacci_circuit_tb();

    reg clk;
    reg reset_n;
    wire [31:0] out;

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        #100;
        reset_n = 1'b1;
        #10000;
        $finish;
    end

    always begin
        clk = ~clk;
        #10;
    end

    fibonacci_circuit task1
    (
        .clk(clk),
        .reset_n(reset_n),
        .num(out)
    );

endmodule
