`timescale 1ns/100ps

module alu_tb ();

    reg clk;
    reg [31:0] pc;
    reg reset_n;
    reg jump_branch_enable;
    reg [31:0] src1_value;
    reg [31:0] src2_value;
    reg [31:0] imm;
    reg [4:0] rd;
    reg [5:0] operation_con;
    wire write_req;
    wire [4:0] write_addr;
    wire [31:0] write_data;

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        jump_branch_enable = 1'b0;
        pc = 32'h0;
        src1_value = 32'h0;
        src2_value = 32'h0;
        imm = 32'h0;
        rd = 5'h0;
        operation_con = 6'h0;
        #100;
        reset_n = 1'b1;
        src1_value = 32'd100;
        src2_value = 32'd50;
        rd = 5'h10;
        operation_con = 6'd12;
        @(posedge clk);
        src1_value = 32'd80;
        src2_value = 32'd120;
        rd = 5'h12;
        operation_con = 6'd12;
        @(posedge clk);
        rd = 5'h13;
        imm = 32'd256;
        operation_con = 6'h1;
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
        .pc(pc),
        .src1_value(src1_value),
        .src2_value(src2_value),
        .imm(imm),
        .rd(rd),
        .operation_con(operation_con),
        .write_req(write_req),
        .write_addr(write_addr),
        .write_data(write_data)
    );
endmodule
