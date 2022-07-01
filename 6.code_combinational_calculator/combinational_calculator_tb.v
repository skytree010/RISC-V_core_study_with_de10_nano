`timescale 1ns/100ps

module combinational_calculator_tb();

    reg [31:0] val1;
    reg [31:0] val2;
    reg [1:0] operation;
    wire [31:0] out;

    initial begin
        val1 = 32'd0;
        val2 = 32'd0;
        operation = 2'd3;
        repeat(255) begin
            val2 = val2 + 1;
            repeat(255) begin
                val1 = val1 + 1;
                repeat(4) begin
                    operation = operation + 1;
                    #10;
                end
            end
        end
        $finish;
    end

    combinational_calculator cal
    (
        .operation(operation),
        .val1(val1),
        .val2(val2),
        .out(out)
    );
endmodule
