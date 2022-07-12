`timescale 1ns/100ps

module jump_branch_tb();

    reg clk;
    reg reset_n;
    reg [31:0] pc;
    reg [4:0] rd;
    reg [31:0] src1_value;
    reg [31:0] src2_value;
    reg [31:0] imm;
    reg [5:0] operation_con;
    wire [31:0] jb_target_pc;
    wire jb_enable;
    wire write_req;
    wire [4:0] write_addr;
    wire [31:0] write_data;

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        pc = 1'b0;
        src1_value = 32'h0;
        src2_value = 32'h0;
        imm = 32'h0;
        operation_con = 6'd0;
        rd = 5'h0;
        #100;
        reset_n = 1'b1;
        src1_value = 32'd100;
        src2_value = 32'd100;
        imm = 32'd10;
        operation_con = 6'd24;
        @(posedge clk);
        operation_con = 6'd25;
        @(posedge clk);
        operation_con = 6'd26;
        @(posedge clk);
        operation_con = 6'd27;
        @(posedge clk);
        operation_con = 6'd28;
        @(posedge clk);
        operation_con = 6'd29;
        @(posedge clk);
        operation_con = 6'd0;
        @(posedge clk);
        @(posedge clk);
        $finish;
    end

    always begin
        #10;
        clk = ~clk;
    end

    jump_branch jb1
    (
        .clk(clk),
        .reset_n(reset_n),
        .pc(pc),
        .src1_value(src1_value),
        .src2_value(src2_value),
        .imm(imm),
        .rd(rd),
        .operation_con(operation_con),
        .jb_target_pc(jb_target_pc),
        .jb_enable(jb_enable),
        .write_req(write_req),
        .write_addr(write_addr),
        .write_data(write_data)
    );
endmodule
