module combinational_calculator
(
    input [1:0] operation,
    input [31:0] val1,
    input [31:0] val2,
    output [31:0] out
);

    localparam SUM = 2'd0;
    localparam SUB = 2'd1;
    localparam MUL = 2'd2;
    localparam DIV = 2'd3;
/*
    wire [31:0] sum;
    wire [31:0] sub;
    wire [31:0] mul;
    wire [31:0] div;

    assign sum = val1 + val2;
    assign sub = val1 - val2;
    assign mul = val1 * val2;
    assign div = val1 / val2;

    assign out = operation == SUM ? sum :
                operation == SUB ? sub :
                operation == MUL ? mul :
                                    div;
*/

    reg [31:0] outreg;

    always @(*) begin
        case(operation)
            SUM:
                outreg = val1 + val2;
            SUB:
                outreg = val1 - val2;
            MUL:
                outreg = val1 * val2;
            DIV:
                outreg = val1 / val2;
        endcase
    end

    assign out = outreg;

endmodule
