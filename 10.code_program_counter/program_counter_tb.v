`timescale 1ns/100ps

module program_counter_tb();

    reg clk;
    reg reset_n;
    wire [31:0] next_pc;
    wire [31:0] pc;

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        #100;
        reset_n = 1'b1;
        #1000;
        $finish;
    end

    always begin
        clk = ~clk;
        #10;
    end

    program_counter pc1
    (
        .clk(clk),
        .reset_n(reset_n),
        .next_pc(next_pc),
        .pc(pc)
    );

endmodule
