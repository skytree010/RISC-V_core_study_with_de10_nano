vlib work
vlog jump_branch_tb.v jump_branch.v
vsim work.jump_branch_tb

add wave /jump_branch_tb/clk
add wave /jump_branch_tb/reset_n
add wave -radix unsigned /jump_branch_tb/src1_value
add wave -radix unsigned /jump_branch_tb/src2_value
add wave -radix unsigned /jump_branch_tb/imm
add wave -radix unsigned /jump_branch_tb/operation_con
add wave -radix unsigned /jump_branch_tb/jb_target_pc
add wave /jump_branch_tb/jb_enable

run -all