vlib work
vlog ripple_carry_adder_8bit_tb.v ripple_carry_adder_8bit.v full_adder.v
vsim work.ripple_carry_adder_8bit_tb

add wave -noupdate -radix hexadecimal /ripple_carry_adder_8bit_tb/in1
add wave -noupdate -radix hexadecimal /ripple_carry_adder_8bit_tb/in2
add wave -noupdate -radix hexadecimal /ripple_carry_adder_8bit_tb/out
add wave -noupdate /ripple_carry_adder_8bit_tb/carry_out

run 10ms