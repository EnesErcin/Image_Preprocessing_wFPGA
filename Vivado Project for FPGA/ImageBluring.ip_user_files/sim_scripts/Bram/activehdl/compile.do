vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/blk_mem_gen_v8_4_5
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap blk_mem_gen_v8_4_5 activehdl/blk_mem_gen_v8_4_5
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_5  -v2k5 \
"../../../../ImageBluring.gen/sources_1/bd/Bram/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/Bram/ip/Bram_blk_mem_gen_0_0/sim/Bram_blk_mem_gen_0_0.v" \
"../../../bd/Bram/ip/Bram_blk_mem_gen_1_0/sim/Bram_blk_mem_gen_1_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/Bram/sim/Bram.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

