vlib work
vlog four_way_multiplexer_tb.v four_way_multiplexer.v
vsim work.four_way_multiplexer_tb

add wave /four_way_multiplexer_tb/in1
add wave /four_way_multiplexer_tb/in2
add wave /four_way_multiplexer_tb/in3
add wave /four_way_multiplexer_tb/in4
add wave -radix hexadecimal /four_way_multiplexer_tb/select
add wave /four_way_multiplexer_tb/out

run 10ms