vlib work
vlog combinational_calculator_tb.v combinational_calculator.v
vsim work.combinational_calculator_tb

add wave -radix hexadecimal /combinational_calculator_tb/operation
add wave -radix hexadecimal /combinational_calculator_tb/val1
add wave -radix hexadecimal /combinational_calculator_tb/val2
add wave -radix hexadecimal /combinational_calculator_tb/out

run 10ms