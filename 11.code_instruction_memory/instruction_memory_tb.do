vlib work
vlog instruction_memory_tb.v instruction_memory.v
vsim work.instruction_memory_tb

add wave /instruction_memory_tb/clk
add wave /instruction_memory_tb/reset_n
add wave /instruction_memory_tb/ce
add wave /instruction_memory_tb/we
add wave -radix hexadecimal /instruction_memory_tb/addr
add wave -radix hexadecimal /instruction_memory_tb/d
add wave -radix hexadecimal /instruction_memory_tb/q

run 10ms