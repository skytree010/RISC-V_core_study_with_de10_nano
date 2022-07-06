module alu
(
    input clk,
    input reset_n,
    input jump_branch_enable,
    input [31:0] src1_value,
    input [31:0] src2_value,
    input [4:0] src1_addr,
    input [4:0] src2_addr,
    input [31:0] imm,
    input [4:0] rd,
    input addi,
    input add,
    output alu_done,
    output [4:0] write_addr,
    output [31:0] result
);

    reg [31:0] result_reg;
    reg [4:0] write_addr_reg;
    reg alu_done_reg;

    always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            result_reg <= 32'h0;
            alu_done_reg <= 1'b0;
            write_addr_reg <= 5'h0;
        end else begin
            if(addi) begin
                if(src1_addr == write_addr)
                    result_reg <= result + imm;
                else
                    result_reg <= src1_value + imm;
                if(jump_branch_enable)
                    alu_done_reg <= 1'b0;
                else
                    alu_done_reg <= 1'b1;
                write_addr_reg <= rd;
            end else if(add) begin
                if(src1_addr == write_addr)
                    result_reg <= result + src2_value;
                else if(src2_addr == write_addr)
                    result_reg <= src1_value + result;
                else
                    result_reg <= src1_value + src2_value;
                if(jump_branch_enable)
                    alu_done_reg <= 1'b0;
                else
                    alu_done_reg <= 1'b1;
                write_addr_reg <= rd;
            end else begin
                result_reg <= 32'h0;
                alu_done_reg <= 1'b0;
                write_addr_reg <= 5'h0;
            end
        end
    end

    assign result = result_reg;
    assign alu_done = alu_done_reg;
    assign write_addr = write_addr_reg;

endmodule
