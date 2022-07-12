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
    wire [31:0] imm;

    wire [4:0] register_read_addr1;
    wire [31:0] register_read_data1;
    wire [4:0] register_read_addr2;
    wire [31:0] register_read_data2;
    
    wire register_write_req;
    wire [31:0] register_write_data;
    wire [4:0] register_write_addr;
    
    wire alu_write_req;
    wire [31:0] alu_write_data;
    wire [4:0] alu_write_addr;

    wire jump_branch_write_req;
    wire [31:0] jump_branch_write_data;
    wire [4:0] jump_branch_write_addr;

    wire data_memory_write_req;
    wire [31:0] data_memory_write_data;
    wire [4:0] data_memory_write_addr;

    wire [5:0] operation_con;

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
        .addr(pc[9:0]),
        .d(32'h0),
        .q(instruction)
    );

    decode_logic dl1
    (
        .clk(clk),
        .reset_n(reset_n),
        .instruction(instruction),
        .jump_branch_enable(jb_enable),
        .rs1(register_read_addr1),
        .rs2(register_read_addr2),
        .rd(rd),
        .imm(imm),
        .operation_con(operation_con)
    );

    register_file rf1
    (
        .clk(clk),
        .reset_n(reset_n),
        .wr_en(register_write_req),
        .wr_index(register_write_addr),
        .wr_data(register_write_data),
        .rd_en1(1'b1),
        .rd_index1(register_read_addr1),
        .rd_en2(1'b1),
        .rd_index2(register_read_addr2),
        .rd_data1(register_read_data1),
        .rd_data2(register_read_data2)
    );

    alu alu1
    (
        .clk(clk),
        .reset_n(reset_n),
        .jump_branch_enable(jb_enable),
        .pc(pc),
        .src1_value(register_read_data1),
        .src2_value(register_read_data2),
        .imm(imm),
        .rd(rd),
        .operation_con(operation_con),
        .write_req(alu_write_req),
        .write_addr(alu_write_addr),
        .write_data(alu_write_data)
    );

    jump_branch jb1
    (
        .clk(clk),
        .reset_n(reset_n),
        .pc(pc),
        .src1_value(register_read_data1),
        .src2_value(register_read_data2),
        .imm(imm),
        .rd(rd),
        .operation_con(operation_con),
        .jb_target_pc(jb_value),
        .jb_enable(jb_enable),
        .write_req(jump_branch_write_req),
        .write_addr(jump_branch_write_addr),
        .write_data(jump_branch_write_data)
    );

    data_memory dm1
    (
        .clk(clk),
        .reset_n(reset_n),
        .jump_branch_enable(jb_enable),
        .src1_value(register_read_data1),
        .src2_value(register_read_data2),
        .imm(imm),
        .rd(rd),
        .operation_con(operation_con),
        .write_req(data_memory_write_req),
        .write_addr(data_memory_write_addr),
        .write_data(data_memory_write_data)
    );

    assign register_write_req = alu_write_req | jump_branch_write_req | data_memory_write_req;
    assign register_write_addr = alu_write_req ? alu_write_addr : (jump_branch_write_req ? jump_branch_write_addr : (data_memory_write_req ? data_memory_write_addr : 5'h0));
    assign register_write_data = alu_write_req ? alu_write_data : (jump_branch_write_req ? jump_branch_write_data : (data_memory_write_req ? data_memory_write_data : 32'h0));

endmodule
