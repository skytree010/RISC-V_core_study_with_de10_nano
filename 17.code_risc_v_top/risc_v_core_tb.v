`timescale 1ns/100ps

module risc_v_core_tb ();

    reg clk;
    reg reset_n;

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        #100;
        reset_n = 1'b1;
        #10000;
        $finish;
    end

    always begin
        #10;
        clk = ~clk;
    end

    risc_v_core core1
    (
        .clk(clk),
        .reset_n(reset_n)
    );

endmodule
