vlib work
vlog full_adder_tb.v full_adder.v
vsim work.full_adder_tb

add wave -noupdate /full_adder_tb/in1
add wave -noupdate /full_adder_tb/in2
add wave -noupdate /full_adder_tb/carry_in
add wave -noupdate /full_adder_tb/out
add wave -noupdate /full_adder_tb/carry_out

run 10us