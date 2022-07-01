module recirculating_calculator
(
    input clk,
    input reset_n,

    input [1:0] operation,
    input [31:0] val1,
    output [31:0] out
);

    localparam SUM = 2'd0;
    localparam SUB = 2'd1;
    localparam MUL = 2'd2;
    localparam DIV = 2'd3;

    reg [31:0] outreg;
    reg [31:0] cal_result;

    always @(posedge clk, negedge reset_n) begin
        if(!reset_n) begin
            outreg <= 32'd0;
        end else begin
            outreg <= cal_result;
        end
    end

    assign out = outreg;

    always @(*) begin
        case(operation)
            SUM:
                cal_result = outreg + val1;
            SUB:
                cal_result = outreg - val1;
            MUL:
                cal_result = outreg * val1;
            DIV:
                cal_result = outreg / val1;
        endcase
    end

endmodule
