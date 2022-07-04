vlib work
vlog program_counter_tb.v program_counter.v
vsim work.program_counter_tb

add wave /program_counter_tb/clk
add wave /program_counter_tb/reset_n
add wave -radix hexadecimal /program_counter_tb/next_pc
add wave -radix hexadecimal /program_counter_tb/pc

run 10ms