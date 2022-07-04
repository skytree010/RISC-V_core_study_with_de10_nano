`timescale 1ns/100ps

module instruction_memory_tb();

    reg clk;
    reg reset_n;
    reg ce;
    reg we;
    reg [31:0] addr;
    reg [31:0] d;
    wire [31:0] q;

    reg [31:0] data[3000:0];

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        ce = 1'b0;
        we = 1'b0;
        addr = 32'd0;
        d = 32'd0;
        #100;
        reset_n = 1'b1;
        ce = 1'b1;
        we = 1'b1;
        repeat(300) begin
            @(posedge clk);
            data[addr] = d;
            addr = addr + 1'b1;
            d = d + 1'b1;
        end
        we = 1'b0;
        addr = 32'd0;
        d = 32'd0;
        @(posedge clk);
        repeat(300) begin
            addr = addr + 1'b1;
            @(posedge clk);
            if(q == data[addr - 1]) begin
            end else begin
                $display("data error!! addr : %d data : %d", addr, q);
            end
        end
        addr = 32'd0;
        ce = 1'b0;
        repeat(256) begin
            @(posedge clk);
            @(posedge clk);
            addr = addr + 1'b1;
        end
        $finish;
    end

    always begin
        clk = ~clk;
        #10;
    end

    instruction_memory mem1
    (
        .clk(clk),
        .ce(ce),
        .we(we),
        .addr(addr),
        .d(d),
        .q(q)
    );

endmodule
