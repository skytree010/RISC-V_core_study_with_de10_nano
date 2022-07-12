module data_memory
(
    input clk,
    input reset_n,
    input jump_branch_enable,
    input [31:0] src1_value,
    input [31:0] src2_value,
    input [31:0] imm,
    input [4:0] rd,
    input [5:0] operation_con,

    output write_req,
    output [4:0] write_addr,
    output [31:0] write_data
);

    `include "../12.code_decode_logic/instruction_param.vh"

    reg [31:0] data_mem [128:0];
    wire [31:0] addr_comb;
    wire [31:0] addr_mem_comb;

    reg [4:0] write_addr_reg;
    reg [31:0] write_data_reg;
    reg write_req_reg;

    assign addr_comb = src1_value + imm;
    assign addr_mem_comb = {{2{1'b0}}, addr_comb[31:2]};

    always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            write_data_reg <= 32'h0;
            write_addr_reg <= 5'h0;
            write_req_reg <= 1'b0;
        end else begin
            if(!jump_branch_enable) begin
                case(operation_con)
                /*
                    LB: begin
                        write_data_reg <= data_mem[addr_mem_comb][{addr_mem_pos_comb + 1 , {3{1'b0}}}:{addr_mem_pos_comb, {3{1'b0}}}];
                    end
                    LH: begin
                        write_data_reg <= data_mem[addr_mem_comb][{addr_mem_pos_comb + 2 , {3{1'b0}}}:{addr_mem_pos_comb, {3{1'b0}}}];
                    end
                */
                    LW: begin
                        write_data_reg <= data_mem[addr_mem_comb];
                        write_addr_reg <= rd;
                        write_req_reg <= 1'b1;
                    end
                /*
                    LBU: begin
                        write_data_reg <= data_mem[addr_mem_comb];
                    end
                    LHU: begin
                        write_data_reg <= data_mem[addr_mem_comb];
                    end
                    SB: begin
                    end
                    SH: begin
                    end
                */
                    SW: begin
                        data_mem[addr_mem_comb] <= src2_value;
                        write_req_reg <= 1'b0;
                    end
                    default: begin
                        write_req_reg <= 1'b0;
                    end
                endcase
            end
        end
    end

    assign write_req = write_req_reg;
    assign write_data = write_data_reg;
    assign write_addr = write_addr_reg;

endmodule
