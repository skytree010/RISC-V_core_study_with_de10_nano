module full_adder
(
    input in1,
    input in2,
    input carry_in,
    output out,
    output carry_out
);

    wire xor1;
    wire and1;
    wire and2;

    assign xor1 = in1 ^ in2;

    assign out = xor1 ^ carry_in;

    assign and1 = carry_in & xor1;

    assign and2 = in1 & in2;

    assign carry_out = and1 | and2;


endmodule
