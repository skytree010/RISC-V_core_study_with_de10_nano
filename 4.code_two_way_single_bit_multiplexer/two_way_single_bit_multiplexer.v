module two_way_single_bit_multiplexer
(
    input in1,
    input in2,
    input select,
    output out
);

/*
assign out = select ? in1 : in2;
*/

    wire invert_select;
    wire select_result1;
    wire select_result2;

    assign invert_select = ~select;
    assign select_result1 = in1 & select;
    assign select_result2 = in2 & invert_select;
    assign out = select_result1 | select_result2;

endmodule
