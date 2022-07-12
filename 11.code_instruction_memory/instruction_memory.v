module instruction_memory
(
    input clk,
    input reset_n,
    input ce,
    input we,
    input [9:0] addr,
    input [31:0] d,
    output [31:0] q
);

    reg [31:0] mem[(2 ** 10) - 1:0];
    reg [9:0] addr_reg;

    initial begin
        $readmemh("code.txt", mem);
    end

    always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            addr_reg <= 10'h0;
        end else begin
            if(ce) begin
                if(we)
                    mem[addr] <= d;
                else
                    addr_reg <= addr;
            end
        end
    end

    assign q = ce ? mem[addr_reg] : 32'h0;

endmodule
