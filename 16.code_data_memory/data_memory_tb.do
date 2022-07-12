vlib work
vlog data_memory_tb.v data_memory.v
vsim work.data_memory_tb

add wave /data_memory_tb/clk
add wave /data_memory_tb/reset_n
add wave /data_memory_tb/jump_branch_enable
add wave -radix hexadecimal /data_memory_tb/src1_value
add wave -radix hexadecimal /data_memory_tb/src2_value
add wave -radix hexadecimal /data_memory_tb/imm
add wave -radix hexadecimal /data_memory_tb/rd
add wave -radix hexadecimal /data_memory_tb/operation_con

add wave /data_memory_tb/write_req
add wave -radix hexadecimal /data_memory_tb/write_addr
add wave -radix hexadecimal /data_memory_tb/write_data

run -all