`timescale 1ns/100ps

module four_way_multiplexer_tb();

    reg in1;
    reg in2;
    reg in3;
    reg in4;
    reg [1:0] select;
    wire out;

    initial begin
        in1 = 1'b0;
        in2 = 1'b0;
        in3 = 1'b0;
        in4 = 1'b0;
        select = 2'b11;
        repeat(16) begin
            repeat(4) begin
                select = select + 1;
                #100;
            end
            {in1, in2, in3, in4} = {in1, in2, in3, in4} + 1;
        end
        $finish;
    end

    four_way_multiplexer multiplexer
    (
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .select(select),
        .out(out)
    );

endmodule
