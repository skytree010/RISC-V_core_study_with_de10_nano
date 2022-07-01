vlib work
vlog counter_tb.v counter.v
vsim work.counter_tb

add wave /counter_tb/clk
add wave /counter_tb/reset_n
add wave -radix unsigned /counter_tb/num

run 10ms