module instruction_memory
(
    input clk,

    input ce,
    input we,
    input [31:0] addr,

    input [31:0] d,
    output [31:0] q
);

    reg [31:0] mem[3000:0];

    reg [31:0] addr_reg;

    always @(posedge clk) begin
        if(ce) begin
            if(we)
                mem[addr] <= d;
            addr_reg <= addr;
        end
    end

    assign q = ce ? mem[addr_reg] : 32'hz;

endmodule
