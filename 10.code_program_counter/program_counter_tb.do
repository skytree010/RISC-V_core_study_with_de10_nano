vlib work
vlog program_counter_tb.v program_counter.v
vsim work.program_counter_tb

add wave /program_counter_tb/clk
add wave /program_counter_tb/reset_n
add wave /program_counter_tb/jb_enable
add wave -radix hexadecimal /program_counter_tb/jb_value
add wave -radix hexadecimal /program_counter_tb/pc

run -all