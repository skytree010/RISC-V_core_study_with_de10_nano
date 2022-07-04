module program_counter
(
    input clk,
    input reset_n,
    output [31:0] next_pc,
    output [31:0] pc
);

    reg [31:0] pc_reg;
    reg [31:0] next_pc_comb;

    always @(*) begin
        if(!reset_n) begin
            next_pc_comb = 32'd0;
        end else begin
            next_pc_comb = pc_reg + 1'b1;
        end
    end

    always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            pc_reg <= 32'd0;
        end else begin
            pc_reg <= next_pc_comb;
        end
    end

    assign next_pc = next_pc_comb;
    assign pc = pc_reg;

endmodule
