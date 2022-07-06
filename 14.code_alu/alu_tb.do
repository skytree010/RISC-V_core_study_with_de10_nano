vlib work
vlog alu_tb.v alu.v
vsim work.alu_tb

add wave /alu_tb/clk
add wave /alu_tb/reset_n
add wave -radix unsigned /alu_tb/src1_value
add wave -radix unsigned /alu_tb/src2_value
add wave -radix unsigned /alu_tb/imm
add wave -radix unsigned /alu_tb/rd
add wave /alu_tb/addi
add wave /alu_tb/add
add wave /alu_tb/alu_done
add wave -radix unsigned /alu_tb/write_addr
add wave -radix unsigned /alu_tb/result

run -all