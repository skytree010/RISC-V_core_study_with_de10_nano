`timescale 1ns/100ps

module full_adder_tb();

    reg in1;
    reg in2;
    reg carry_in;
    wire out;
    wire carry_out;

    initial begin
        in1 = 1'b0;
        in2 = 1'b0;
        carry_in = 1'b0;
        #100;
        in1 = 1'b0;
        in2 = 1'b0;
        carry_in = 1'b1;
        #100;
        in1 = 1'b0;
        in2 = 1'b1;
        carry_in = 1'b0;
        #100;
        in1 = 1'b0;
        in2 = 1'b1;
        carry_in = 1'b1;
        #100;
        in1 = 1'b1;
        in2 = 1'b0;
        carry_in = 1'b0;
        #100;
        in1 = 1'b1;
        in2 = 1'b0;
        carry_in = 1'b1;
        #100;
        in1 = 1'b1;
        in2 = 1'b1;
        carry_in = 1'b0;
        #100;
        in1 = 1'b1;
        in2 = 1'b1;
        carry_in = 1'b1;
        #100;
        $finish;
    end

    full_adder full_adder1
    (
        .in1(in1),
        .in2(in2),
        .carry_in(carry_in),
        .out(out),
        .carry_out(carry_out)
    );

endmodule