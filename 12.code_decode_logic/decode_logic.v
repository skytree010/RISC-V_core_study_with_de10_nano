module decode_logic
(
    input clk,
    input reset_n,
    input [31:0] instruction,
    input jump_branch_enable,
    output [4:0] rs1,
    output [4:0] rs2,
    output [4:0] rd,
    output [31:0] imm,
    output beq,
    output bne,
    output blt,
    output bge,
    output bltu,
    output bgeu,
    output addi,
    output add
);

    wire instruction_invalid;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [6:0] opcode;
    wire imm_valid;

    wire [10:0] dec_bits_11;
    wire [9:0] dec_bits_10;

    wire [31:0] imm_comb;
    reg [31:0] imm_priv_reg;
    reg [31:0] imm_final_reg;

    wire [4:0] rd_comb;
    reg [4:0] rd_priv_reg;
    reg [4:0] rd_final_reg;

    wire [4:0] rs1_comb;
    wire [4:0] rs2_comb;
    reg [4:0] rs1_reg;
    reg [4:0] rs2_reg;

    reg beq_priv_reg;
    reg bne_priv_reg;
    reg blt_priv_reg;
    reg bge_priv_reg;
    reg bltu_priv_reg;
    reg bgeu_priv_reg;
    reg addi_priv_reg;
    reg add_priv_reg;

    reg beq_final_reg;
    reg bne_final_reg;
    reg blt_final_reg;
    reg bge_final_reg;
    reg bltu_final_reg;
    reg bgeu_final_reg;
    reg addi_final_reg;
    reg add_final_reg;

    always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            beq_priv_reg <= 1'b0;
            bne_priv_reg <= 1'b0;
            blt_priv_reg <= 1'b0;
            bge_priv_reg <= 1'b0;
            bltu_priv_reg <= 1'b0;
            bgeu_priv_reg <= 1'b0;
            addi_priv_reg <= 1'b0;
            add_priv_reg <= 1'b0;
        end else begin
            case(dec_bits_10)
                10'b000_1100011: begin
                    beq_priv_reg <= 1'b1;
                    bne_priv_reg <= 1'b0;
                    blt_priv_reg <= 1'b0;
                    bge_priv_reg <= 1'b0;
                    bltu_priv_reg <= 1'b0;
                    bgeu_priv_reg <= 1'b0;
                    addi_priv_reg <= 1'b0;
                end
                10'b001_1100011: begin
                    bne_priv_reg <= 1'b1;
                    beq_priv_reg <= 1'b0;
                    blt_priv_reg <= 1'b0;
                    bge_priv_reg <= 1'b0;
                    bltu_priv_reg <= 1'b0;
                    bgeu_priv_reg <= 1'b0;
                    addi_priv_reg <= 1'b0;
                end
                10'b100_1100011: begin
                    blt_priv_reg <= 1'b1;
                    beq_priv_reg <= 1'b0;
                    bne_priv_reg <= 1'b0;
                    bge_priv_reg <= 1'b0;
                    bltu_priv_reg <= 1'b0;
                    bgeu_priv_reg <= 1'b0;
                    addi_priv_reg <= 1'b0;
                end
                10'b101_1100011: begin
                    bge_priv_reg <= 1'b1;
                    beq_priv_reg <= 1'b0;
                    bne_priv_reg <= 1'b0;
                    blt_priv_reg <= 1'b0;
                    bltu_priv_reg <= 1'b0;
                    bgeu_priv_reg <= 1'b0;
                    addi_priv_reg <= 1'b0;
                end
                10'b110_1100011: begin
                    bltu_priv_reg <= 1'b1;
                    beq_priv_reg <= 1'b0;
                    bne_priv_reg <= 1'b0;
                    blt_priv_reg <= 1'b0;
                    bge_priv_reg <= 1'b0;
                    bgeu_priv_reg <= 1'b0;
                    addi_priv_reg <= 1'b0;
                end
                10'b111_1100011: begin
                    bgeu_priv_reg <= 1'b1;
                    beq_priv_reg <= 1'b0;
                    bne_priv_reg <= 1'b0;
                    blt_priv_reg <= 1'b0;
                    bge_priv_reg <= 1'b0;
                    bltu_priv_reg <= 1'b0;
                    addi_priv_reg <= 1'b0;
                end
                10'b000_0010011: begin
                    addi_priv_reg <= 1'b1;
                    beq_priv_reg <= 1'b0;
                    bne_priv_reg <= 1'b0;
                    blt_priv_reg <= 1'b0;
                    bge_priv_reg <= 1'b0;
                    bltu_priv_reg <= 1'b0;
                    bgeu_priv_reg <= 1'b0;
                end
                default: begin
                    beq_priv_reg <= 1'b0;
                    bne_priv_reg <= 1'b0;
                    blt_priv_reg <= 1'b0;
                    bge_priv_reg <= 1'b0;
                    bltu_priv_reg <= 1'b0;
                    bgeu_priv_reg <= 1'b0;
                    addi_priv_reg <= 1'b0;
                end
            endcase
            case(dec_bits_11)
                11'b0_000_0110011:
                    add_priv_reg <= 1'b1;
                default:
                    add_priv_reg <= 1'b0;
            endcase
        end
    end

    always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            beq_final_reg <= 1'b0;
            bne_final_reg <= 1'b0;
            blt_final_reg <= 1'b0;
            bge_final_reg <= 1'b0;
            bltu_final_reg <= 1'b0;
            bgeu_final_reg <= 1'b0;
            addi_final_reg <= 1'b0;
            add_final_reg <= 1'b0;
        end else begin
            if(jump_branch_enable) begin
                beq_final_reg <= 1'b0;
                bne_final_reg <= 1'b0;
                blt_final_reg <= 1'b0;
                bge_final_reg <= 1'b0;
                bltu_final_reg <= 1'b0;
                bgeu_final_reg <= 1'b0;
                addi_final_reg <= 1'b0;
                add_final_reg <= 1'b0;
            end else begin
                beq_final_reg <= beq_priv_reg;
                bne_final_reg <= bne_priv_reg;
                blt_final_reg <= blt_priv_reg;
                bge_final_reg <= bge_priv_reg;
                bltu_final_reg <= bltu_priv_reg;
                bgeu_final_reg <= bgeu_priv_reg;
                addi_final_reg <= addi_priv_reg;
                add_final_reg <= add_priv_reg;
            end
        end
    end

    always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            imm_priv_reg <= 32'h0;
            imm_final_reg <= 32'h0;

            rd_priv_reg <= 5'h0;
            rd_final_reg <= 5'h0;

            rs1_reg <= 5'h0;
            rs2_reg <= 5'h0;
        end else begin
            imm_priv_reg <= imm_comb;
            imm_final_reg <= imm_priv_reg;

            rd_priv_reg <= rd_comb;
            rd_final_reg <= rd_priv_reg;

            rs1_reg <= rs1_comb;
            rs2_reg <= rs2_comb;
        end
    end

    decode_instruction dec_inst1
    (
        .instruction(instruction),
        .instruction_invalid(instruction_invalid),
        .funct3(funct3),
        .funct7(funct7),
        .rs1(rs1_comb),
        .rs2(rs2_comb),
        .rd(rd_comb),
        .opcode(opcode),
        .imm_valid(imm_valid),
        .imm(imm_comb)
    );

    assign dec_bits_11 = {funct7[5], funct3, opcode};
    assign dec_bits_10 = {funct3, opcode};

    assign beq = beq_final_reg;
    assign bne = bne_final_reg;
    assign blt = blt_final_reg;
    assign bge = bge_final_reg;
    assign bltu = bltu_final_reg;
    assign bgeu = bgeu_final_reg;
    assign addi = addi_final_reg;
    assign add = add_final_reg;

    assign imm = imm_final_reg;
    assign rd = rd_final_reg;

    assign rs1 = rs1_reg;
    assign rs2 = rs2_reg;

endmodule
