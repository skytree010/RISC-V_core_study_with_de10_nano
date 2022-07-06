`timescale 1ns/100ps

module alu_tb ();

    reg clk;
    reg reset_n;
    reg jump_branch_enable;
    reg [31:0] src1_value;
    reg [31:0] src2_value;
    reg [4:0] src1_addr;
    reg [4:0] src2_addr;
    reg [31:0] imm;
    reg [4:0] rd;
    reg addi;
    reg add;
    wire alu_done;
    wire [4:0] write_addr;
    wire [31:0] result;

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        jump_branch_enable = 1'b0;
        src1_value = 32'h0;
        src2_value = 32'h0;
        src1_addr = 5'h0;
        src2_addr = 5'h0;
        imm = 32'h0;
        rd = 5'h0;
        addi = 1'b0;
        add = 1'b0;
        #100;
        reset_n = 1'b1;
        src1_value = 32'd100;
        src2_value = 32'd50;
        rd = 5'h10;
        add = 1'b1;
        @(posedge clk);
        src1_value = 32'd80;
        src2_value = 32'd120;
        rd = 5'h12;
        add = 1'b1;
        @(posedge clk);
        add = 1'b0;
        rd = 5'h13;
        imm = 32'd256;
        addi = 1'b1;
        @(posedge clk);
        @(posedge clk);
        $finish;
    end

    always begin
        #10;
        clk = ~clk;
    end

    alu alu1
    (
        .clk(clk),
        .reset_n(reset_n),
        .jump_branch_enable(jump_branch_enable),
        .src1_value(src1_value),
        .src2_value(src2_value),
        .src1_addr(src1_addr),
        .src2_addr(src2_addr),
        .imm(imm),
        .rd(rd),
        .addi(addi),
        .add(add),
        .alu_done(alu_done),
        .write_addr(write_addr),
        .result(result)
    );
endmodule
