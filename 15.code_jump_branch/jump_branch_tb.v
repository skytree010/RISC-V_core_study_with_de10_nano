`timescale 1ns/100ps

module jump_branch_tb();

    reg clk;
    reg reset_n;
    reg [31:0] pc;
    reg [31:0] src1_value;
    reg [31:0] src2_value;
    reg [31:0] imm;
    reg beq;
    reg bne;
    reg blt;
    reg bge;
    reg bltu;
    reg bgeu;
    wire [31:0] jb_target_pc;
    wire jb_enable;

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        pc = 1'b0;
        src1_value = 32'h0;
        src2_value = 32'h0;
        imm = 32'h0;
        beq = 1'b0;
        bne = 1'b0;
        blt = 1'b0;
        bge = 1'b0;
        bltu = 1'b0;
        bgeu = 1'b0;
        #100;
        reset_n = 1'b1;
        src1_value = 32'd100;
        src2_value = 32'd100;
        imm = 32'd10;
        beq = 1'b1;
        @(posedge clk);
        beq = 1'b0;
        bne = 1'b1;
        @(posedge clk);
        bne = 1'b0;
        blt = 1'b1;
        @(posedge clk);
        blt = 1'b0;
        bge = 1'b1;
        @(posedge clk);
        bge = 1'b0;
        bltu = 1'b1;
        @(posedge clk);
        bltu = 1'b0;
        bgeu = 1'b1;
        @(posedge clk);
        bgeu = 1'b0;
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
        .beq(beq),
        .bne(bne),
        .blt(blt),
        .bge(bge),
        .bltu(bltu),
        .bgeu(bgeu),
        .jb_target_pc(jb_target_pc),
        .jb_enable(jb_enable)
    );
endmodule
