module four_way_multiplexer
(
    input in1,
    input in2,
    input in3,
    input in4,
    input [1:0] select,
    output reg out
);

    always @(*) begin
        case(select)
            0:
                out = in1;
            1:
                out = in2;
            2:
                out = in3;
            default:
                out = in4;
        endcase
    end

endmodule
