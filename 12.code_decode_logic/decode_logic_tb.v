`timescale 1ns/100ps

module decode_logic_tb();

    reg clk;
    reg reset_n;
    reg [31:0] instruction;
    reg jump_branch_enable;

    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [4:0] rd;
    wire [31:0] imm;
    wire [5:0] operation_con;

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        jump_branch_enable <= 1'b0;
        #100;
        reset_n = 1'b1;
        instruction = 32'h0;
        repeat(10000) begin
            @(posedge clk);
            instruction = instruction + 1'b1;
        end
        $finish;
    end

    always begin
        #10;
        clk = ~clk;
    end

    decode_logic dec_logic1
    (
        .clk(clk),
        .reset_n(reset_n),
        .instruction(instruction),
        .jump_branch_enable(jump_branch_enable),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .imm(imm),
        .operation_con(operation_con)
    );
endmodule
