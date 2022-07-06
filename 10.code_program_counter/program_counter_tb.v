`timescale 1ns/100ps

module program_counter_tb();

    reg clk;
    reg reset_n;
    reg jb_enable;
    reg [31:0] jb_value;
    wire [31:0] pc;

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        jb_enable = 1'b0;
        jb_value = 32'h0;
        #100;
        reset_n = 1'b1;
        #1000;
        jb_value = 32'd100;
        jb_enable = 1'b1;
        @(posedge clk);
        @(posedge clk);
        jb_enable = 1'b0;
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
        .jb_enable(jb_enable),
        .jb_value(jb_value),
        .pc(pc)
    );

endmodule
