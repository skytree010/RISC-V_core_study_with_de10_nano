vlib work
vlog invert_tb.v invert.v
vsim work.invert_tb

add wave -noupdate /invert_tb/input1
add wave -noupdate /invert_tb/output1

run 10us