vlib work
vlog register_file_tb.v register_file.v
vsim work.register_file_tb

add wave /register_file_tb/clk
add wave /register_file_tb/wr_en
add wave -radix unsigned /register_file_tb/wr_index
add wave -radix unsigned /register_file_tb/wr_data
add wave /register_file_tb/rd_en1
add wave -radix unsigned /register_file_tb/rd_index1
add wave -radix unsigned /register_file_tb/rd_data1
add wave /register_file_tb/rd_en2
add wave -radix unsigned /register_file_tb/rd_index2
add wave -radix unsigned /register_file_tb/rd_data2

run -all