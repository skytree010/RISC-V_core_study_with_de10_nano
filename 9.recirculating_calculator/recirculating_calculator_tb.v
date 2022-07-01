`timescale 1ns/100ps

module recirculating_calculator_tb();
    reg clk;
    reg reset_n;
    reg [1:0] operation;
    reg [31:0] val1;
    wire [31:0] out;

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        operation = 2'd0;
        val1 = 32'd0;
        #100;
        reset_n = 1'b1;
        #100;
        operation = 2'd3;
        repeat(4) begin
            operation = operation + 1'b1;
            repeat(100) begin
                val1 = val1 + 1'b1;
                #100;
            end
            val1 = 32'd0;
        end
        $finish;
    end

    always begin
        clk = ~clk;
        #10;
    end

    recirculating_calculator calc
    (
        .clk(clk),
        .reset_n(reset_n),

        .operation(operation),
        .val1(val1),
        .out(out)
    );

endmodule
