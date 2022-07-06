module jump_branch
(
    input clk,
    input reset_n,
    input [31:0] pc,
    input [31:0] src1_value,
    input [31:0] src2_value,
    input [31:0] imm,
    input beq,
    input bne,
    input blt,
    input bge,
    input bltu,
    input bgeu,
    output [31:0] jb_target_pc,
    output jb_enable
);

    reg taken_branch_reg;
    reg [31:0] target_pc_reg;

    reg [31:0] pc_wait_reg [2:0];
    wire [31:0] target_shift;

    always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            pc_wait_reg[0] <= 32'h0;
            pc_wait_reg[1] <= 32'h0;
            pc_wait_reg[2] <= 32'h0;
        end else begin
            pc_wait_reg[0] <= pc;
            pc_wait_reg[1] <= pc_wait_reg[0];
            pc_wait_reg[2] <= pc_wait_reg[1];
        end
    end

    always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            taken_branch_reg <= 1'b0;
        end else begin
            if(beq)
                taken_branch_reg <= (src1_value == src2_value);
            else if(bne)
                taken_branch_reg <= (src1_value != src2_value);
            else if(blt)
                taken_branch_reg <= (src1_value < src2_value) ^ (src1_value[31] != src2_value[31]);
            else if(bge)
                taken_branch_reg <= (src1_value >= src2_value) ^ (src1_value[31] != src2_value[31]);
            else if(bltu)
                taken_branch_reg <= (src1_value < src2_value);
            else if(bgeu)
                taken_branch_reg <= (src1_value >= src2_value);
            else
                taken_branch_reg <= 1'b0;
            target_pc_reg <= pc_wait_reg[2] + ((imm >> 2) | target_shift);
        end
    end

    assign target_shift = {imm[31], imm[31], {30{1'b0}}};

    assign jb_target_pc = target_pc_reg;
    assign jb_enable = taken_branch_reg;

endmodule
