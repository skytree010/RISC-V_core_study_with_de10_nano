module risc_v_core
(
    input clk,
    input reset_n
);

    wire jb_enable;
    wire [31:0] jb_value;
    wire [31:0] pc;
    wire [31:0] instruction;
    wire [4:0] rd;

    wire [4:0] register_read_addr1;
    wire [31:0] register_read_data1;
    wire [4:0] register_read_addr2;
    wire [31:0] register_read_data2;
    wire [4:0] register_write_addr;
    wire [31:0] imm;
    wire [31:0] alu_result;
    wire [4:0] alu_read_addr1;
    wire [4:0] alu_read_addr2;
    
    wire alu_done;

    wire beq;
    wire bne;
    wire blt;
    wire bge;
    wire bltu;
    wire bgeu;
    wire addi;
    wire add;

    program_counter pc1
    (
        .clk(clk),
        .reset_n(reset_n),
        .jb_enable(jb_enable),
        .jb_value(jb_value),
        .pc(pc)
    );

    instruction_memory im1
    (
        .clk(clk),
        .reset_n(reset_n),
        .ce(1'b1),
        .we(1'b0),
        .addr(pc),
        .d(32'h0),
        .q(instruction)
    );

    decode_logic dl1
    (
        .clk(clk),
        .reset_n(reset_n),
        .instruction(instruction),
        .jump_branch_enable(branch_enable),
        .rs1(register_read_addr1),
        .rs2(register_read_addr2),
        .rd(rd),
        .imm(imm),
        .beq(beq),
        .bne(bne),
        .blt(blt),
        .bge(bge),
        .bltu(bltu),
        .bgeu(bgeu),
        .addi(addi),
        .add(add)
    );

    register_file rf1
    (
        .clk(clk),
        .reset_n(reset_n),
        .wr_en(alu_done),
        .wr_index(register_write_addr),
        .wr_data(alu_result),
        .rd_en1(1'b1),
        .rd_index1(register_read_addr1),
        .rd_en2(1'b1),
        .rd_index2(register_read_addr2),
        .rd_data1(register_read_data1),
        .rd_data2(register_read_data2),
        .rd_addr1(alu_read_addr1),
        .rd_addr2(alu_read_addr2)
    );

    alu alu1
    (
        .clk(clk),
        .reset_n(reset_n),
        .jump_branch_enable(branch_enable),
        .src1_value(register_read_data1),
        .src2_value(register_read_data2),
        .src1_addr(alu_read_addr1),
        .src2_addr(alu_read_addr2),
        .imm(imm),
        .rd(rd),
        .addi(addi),
        .add(add),
        .alu_done(alu_done),
        .write_addr(register_write_addr),
        .result(alu_result)
    );

    jump_branch jb1
    (
        .clk(clk),
        .reset_n(reset_n),
        .pc(pc),
        .src1_value(register_read_data1),
        .src2_value(register_read_data2),
        .imm(imm),
        .beq(beq),
        .bne(bne),
        .blt(blt),
        .bge(bge),
        .bltu(bltu),
        .bgeu(bgeu),
        .jb_target_pc(jb_value),
        .jb_enable(jb_enable)
    );





endmodule
