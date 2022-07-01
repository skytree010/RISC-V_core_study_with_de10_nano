module ripple_carry_adder_8bit
(
    input [7:0] in1,
    input [7:0] in2,
    output [7:0] out,
    output carry_out
);

/*
    wire [8:0] temp_out;

    assign temp_out = in1 + in2;

    assign out = temp_out[7:0];

    assign carry_out = temp_out[8];
*/

    wire carry_out1;
    wire carry_out2;
    wire carry_out3;
    wire carry_out4;
    wire carry_out5;
    wire carry_out6;
    wire carry_out7;

    full_adder adder1 
    (
    .in1(in1[0]),
    .in2(in2[0]),
    .carry_in(1'b0),
    .out(out[0]),
    .carry_out(carry_out1)
    );

    full_adder adder2 
    (
    .in1(in1[1]),
    .in2(in2[1]),
    .carry_in(carry_out1),
    .out(out[1]),
    .carry_out(carry_out2)
    );

    full_adder adder3
    (
    .in1(in1[2]),
    .in2(in2[2]),
    .carry_in(carry_out2),
    .out(out[2]),
    .carry_out(carry_out3)
    );

    full_adder adder4 
    (
    .in1(in1[3]),
    .in2(in2[3]),
    .carry_in(carry_out3),
    .out(out[3]),
    .carry_out(carry_out4)
    );

    full_adder adder5
    (
    .in1(in1[4]),
    .in2(in2[4]),
    .carry_in(carry_out4),
    .out(out[4]),
    .carry_out(carry_out5)
    );

    full_adder adder6
    (
    .in1(in1[5]),
    .in2(in2[5]),
    .carry_in(carry_out5),
    .out(out[5]),
    .carry_out(carry_out6)
    );

    full_adder adder7 
    (
    .in1(in1[6]),
    .in2(in2[6]),
    .carry_in(carry_out6),
    .out(out[6]),
    .carry_out(carry_out7)
    );

    full_adder adder8
    (
    .in1(in1[7]),
    .in2(in2[7]),
    .carry_in(carry_out7),
    .out(out[7]),
    .carry_out(carry_out)
    );

endmodule