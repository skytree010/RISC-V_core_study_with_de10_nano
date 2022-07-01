vlib work
vlog fibonacci_circuit.v fibonacci_circuit_tb.v
vsim work.fibonacci_circuit_tb

add wave /fibonacci_circuit_tb/clk
add wave /fibonacci_circuit_tb/reset_n
add wave -radix unsigned /fibonacci_circuit_tb/out
add wave -radix unsigned /fibonacci_circuit_tb/task1/num1
add wave -radix unsigned /fibonacci_circuit_tb/task1/num2

run 10ms