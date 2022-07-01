`timescale 1ns/100ps

module invert_tb();

    reg input1;
    wire output1;

    initial begin
        input1 = 1'b0;
        #100;
        input1 = 1'b1;
        #100;
        input1 = 1'b0;
        #10;
        input1 = 1'b1;
        #10;
        input1 = 1'b0;
        #50;
        input1 = 1'b1;
        #50;
        $finish;
    end

    invert invert1
    (
        .input1(input1),
        .output1(output1)
    );

endmodule
