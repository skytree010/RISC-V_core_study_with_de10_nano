`timescale 1ns/100ps

module register_file_tb();

    reg clk;
    reg reset_n;
    reg wr_en;
    reg [4:0] wr_index;
    reg [31:0] wr_data;
    reg rd_en1;
    reg [4:0] rd_index1;
    reg rd_en2;
    reg [4:0] rd_index2;
    wire [31:0] rd_data1;
    wire [31:0] rd_data2;
    wire [4:0] rd_addr1;
    wire [4:0] rd_addr2;

    reg [31:0] data [31:0];

    initial begin
        clk = 1'b0;
        reset_n = 1'b0;
        wr_en = 1'b0;
        rd_en1 = 1'b0;
        rd_en2 = 1'b0;
        wr_index = 5'h0;
        rd_index1 = 5'h0;
        rd_index2 = 5'h0;
        wr_data = 32'h0;
        #100;
        reset_n = 1'b1;
        @(posedge clk);
        wr_en = 1'b1;
        wr_data = wr_index;
        repeat(31) begin
            @(posedge clk);
            wr_index = wr_index + 1'b1;
            wr_data = wr_index;
        end
        @(posedge clk);
        wr_en = 1'b0;
        rd_en1 = 1'b1;
        rd_en2 = 1'b1;
        repeat(31) begin
            @(posedge clk);
            rd_index1 = rd_index1 + 1;
            rd_index2 = rd_index2 + 1;
        end
        @(posedge clk);
        @(posedge clk);
        $finish;
    end

    always begin
        #10;
        clk = ~clk;
    end

    register_file rf1
    (
        .clk(clk),
        .reset_n(reset_n),
        .wr_en(wr_en),
        .wr_index(wr_index),
        .wr_data(wr_data),
        .rd_en1(rd_en1),
        .rd_index1(rd_index1),
        .rd_en2(rd_en2),
        .rd_index2(rd_index2),
        .rd_data1(rd_data1),
        .rd_data2(rd_data2),
        .rd_addr1(rd_addr1),
        .rd_addr2(rd_addr2)
    );
endmodule
