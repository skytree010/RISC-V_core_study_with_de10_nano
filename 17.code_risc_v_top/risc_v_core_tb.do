vlib work
vlog risc_v_core_tb.v risc_v_core.v ../10.code_program_counter/program_counter.v ../11.code_instruction_memory/instruction_memory.v ../12.code_decode_logic/decode_logic.v ../12.code_decode_logic/decode_instruction.v ../13.code_register_file/register_file.v ../14.code_alu/alu.v ../15.code_jump_branch/jump_branch.v ../16.code_data_memory/data_memory.v ../16.code_data_memory/data_memory_ctrl.v
vsim work.risc_v_core_tb

add wave -divider input
add wave /risc_v_core_tb/clk
add wave /risc_v_core_tb/reset_n

add wave -divider program_counter
add wave -radix hexadecimal /risc_v_core_tb/core1/pc1/pc_reg
add wave -radix hexadecimal /risc_v_core_tb/core1/pc1/next_pc_comb

add wave -divider instruction_memory
add wave -radix hexadecimal /risc_v_core_tb/core1/im1/mem
add wave -radix hexadecimal /risc_v_core_tb/core1/dl1/instruction

add wave -divider decode_logic
add wave -radix hexadecimal /risc_v_core_tb/core1/dl1/rs1
add wave -radix hexadecimal /risc_v_core_tb/core1/dl1/rs2
add wave -radix hexadecimal /risc_v_core_tb/core1/dl1/rd
add wave -radix hexadecimal /risc_v_core_tb/core1/dl1/imm
add wave /risc_v_core_tb/core1/dl1/dec_bits_11
add wave -radix hexadecimal /risc_v_core_tb/core1/dl1/funct7
add wave -radix unsigned /risc_v_core_tb/core1/dl1/operation_con

add wave -divider register_file
add wave /risc_v_core_tb/core1/rf1/wr_en
add wave -radix hexadecimal /risc_v_core_tb/core1/rf1/wr_index
add wave -radix hexadecimal /risc_v_core_tb/core1/rf1/wr_data
add wave -radix hexadecimal /risc_v_core_tb/core1/rf1/rd_index1
add wave -radix hexadecimal /risc_v_core_tb/core1/rf1/rd_index2
add wave -radix hexadecimal /risc_v_core_tb/core1/rf1/rd_data1
add wave -radix hexadecimal /risc_v_core_tb/core1/rf1/rd_data2
add wave -radix hexadecimal /risc_v_core_tb/core1/rf1/mem

add wave -divider alu
add wave -radix hexadecimal /risc_v_core_tb/core1/alu1/src1_value
add wave -radix hexadecimal /risc_v_core_tb/core1/alu1/src2_value
add wave -radix hexadecimal /risc_v_core_tb/core1/alu1/imm
add wave -radix hexadecimal /risc_v_core_tb/core1/alu1/rd
add wave /risc_v_core_tb/core1/alu1/write_req
add wave -radix hexadecimal /risc_v_core_tb/core1/alu1/write_addr
add wave -radix hexadecimal /risc_v_core_tb/core1/alu1/write_data

add wave -divider jump_branch
add wave -radix hexadecimal /risc_v_core_tb/core1/jb1/src1_value
add wave -radix hexadecimal /risc_v_core_tb/core1/jb1/src2_value
add wave -radix hexadecimal /risc_v_core_tb/core1/jb1/imm
add wave -radix hexadecimal /risc_v_core_tb/core1/jb1/jb_target_pc
add wave /risc_v_core_tb/core1/jb1/jb_enable

add wave -divider data_memory

run -all