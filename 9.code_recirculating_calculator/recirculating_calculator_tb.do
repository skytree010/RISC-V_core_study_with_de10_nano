vlib work
vlog recirculating_calculator_tb.v recirculating_calculator.v
vsim work.recirculating_calculator_tb

add wave /recirculating_calculator_tb/clk
add wave /recirculating_calculator_tb/reset_n
add wave -radix unsigned /recirculating_calculator_tb/operation
add wave -radix unsigned /recirculating_calculator_tb/val1
add wave -radix unsigned /recirculating_calculator_tb/out

run 10ms