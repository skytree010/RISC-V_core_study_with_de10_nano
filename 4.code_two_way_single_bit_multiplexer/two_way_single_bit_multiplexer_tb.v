`timescale 1ns/100ps

module two_way_single_bit_multiplexer_tb();

    reg in1;
    reg in2;
    reg select;
    wire out;

    initial begin
        in1 = 1'b0;
        in2 = 1'b0;
        select = 1'b0;
        #100;

        in1 = 1'b0;
        in2 = 1'b0;
        select = 1'b1;
        #100;

        in1 = 1'b0;
        in2 = 1'b1;
        select = 1'b0;
        #100;

        in1 = 1'b0;
        in2 = 1'b1;
        select = 1'b1;
        #100;

        in1 = 1'b1;
        in2 = 1'b0;
        select = 1'b0;
        #100;

        in1 = 1'b1;
        in2 = 1'b0;
        select = 1'b1;
        #100;

        in1 = 1'b1;
        in2 = 1'b1;
        select = 1'b0;
        #100;

        in1 = 1'b1;
        in2 = 1'b1;
        select = 1'b1;
        #100;
        
        $finish;
    end

    two_way_single_bit_multiplexer multiplexer
    (
        .in1(in1),
        .in2(in2),
        .select(select),
        .out(out)
    );

endmodule
