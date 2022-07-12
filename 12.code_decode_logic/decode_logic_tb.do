vlib work
vlog decode_logic_tb.v decode_logic.v decode_instruction.v
vsim work.decode_logic_tb

add wave /decode_logic_tb/clk
add wave /decode_logic_tb/reset_n
add wave -radix hexadecimal /decode_logic_tb/instruction
add wave /decode_logic_tb/dec_logic1/dec_inst1/is_r_instruction_comb
add wave /decode_logic_tb/dec_logic1/dec_inst1/is_i_instruction_comb
add wave /decode_logic_tb/dec_logic1/dec_inst1/is_s_instruction_comb
add wave /decode_logic_tb/dec_logic1/dec_inst1/is_b_instruction_comb
add wave /decode_logic_tb/dec_logic1/dec_inst1/is_u_instruction_comb
add wave /decode_logic_tb/dec_logic1/dec_inst1/is_j_instruction_comb
add wave -radix unsigned /decode_logic_tb/operation_con

run -all