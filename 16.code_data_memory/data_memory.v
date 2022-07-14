module data_memory
(
    input clk,
    input ce,
    input we,
    input [7:0] addr,
    input [7:0] d,
    output [7:0] q
);

    reg [7:0] data_mem [127:0];
    reg [7:0] q_reg;

    always @(posedge clk) begin
        if(we) begin
            if(ce)
                data_mem[addr] <= d;
        end
        q_reg <= data_mem[addr];
    end

    assign q = ce ? q_reg : 8'h0;

endmodule
