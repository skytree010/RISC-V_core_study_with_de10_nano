`timescale 1ns/100ps
module ripple_carry_adder_8bit_tb();

    reg [7:0] in1;
    reg [7:0] in2;
    wire [7:0] out;
    wire carry_out;

    initial begin
        in1 = 8'd0;
        in2 = 8'd0;
        #100;
        repeat(255) begin
            in1 = in1 + 1;
            in2 = in2 + 1;
            #100;
        end
        $finish;
    end

    ripple_carry_adder_8bit adder
    (
        .in1(in1),
        .in2(in2),
        .out(out),
        .carry_out(carry_out)
    );

endmodule
