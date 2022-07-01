module counter
(
    input clk,
    input reset_n,
    output [15:0] num
);

    reg [15:0] countnum;

    always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            countnum <= 16'd0;
        end else begin
            countnum <= countnum + 1'b1;
        end
    end

    assign num = countnum;

endmodule
