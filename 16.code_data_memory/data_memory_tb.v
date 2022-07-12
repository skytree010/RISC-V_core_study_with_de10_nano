`timescale 1ns/100ps

module data_memory_tb ();

    reg clk;
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

    `include "../12.code_decode_logic/instruction_param.vh"

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        jump_branch_enable = 1'b0;
        src1_value = 32'h0;
        src2_value = 32'h0;
        imm = 32'h0;
        rd = 5'h0;
        operation_con = 6'h0;
        #100;
        reset_n = 1'b1;
        @(posedge clk);
        repeat(100) begin
            operation_con = SW;
            src2_value = src2_value + 2;
            imm = imm + 4;
            @(posedge clk);
        end
        src2_value = 32'h0;
        imm = 32'h0;
        repeat(100) begin
            operation_con = LW;
            imm = imm + 4;
            @(posedge clk);
        end
        @(posedge clk);
        @(posedge clk);
        $finish;
    end

    always begin
        #10;
        clk = ~clk;
    end

    data_memory dm1
    (
        .clk(clk),
        .reset_n(reset_n),
        .jump_branch_enable(jump_branch_enable),
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
