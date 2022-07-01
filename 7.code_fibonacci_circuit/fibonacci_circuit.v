module fibonacci_circuit
(
    input clk,
    input reset_n,
    output [31:0] num
);

    reg [31:0] num1;
    reg [31:0] num2;

    always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            num1 <= 32'd1;
            num2 <= 32'd1;
        end else begin
            num1 <= num1 + num2;
            num2 <= num1;
        end
    end

    assign num = num1;

endmodule
