vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/blk_mem_gen_v8_4_5
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap blk_mem_gen_v8_4_5 questa_lib/msim/blk_mem_gen_v8_4_5
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu -sv \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_5  -incr -mfcu \
"../../../../ImageBluring.gen/sources_1/bd/Bram/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -mfcu \
"../../../bd/Bram/ip/Bram_blk_mem_gen_0_0/sim/Bram_blk_mem_gen_0_0.v" \
"../../../bd/Bram/ip/Bram_blk_mem_gen_1_0/sim/Bram_blk_mem_gen_1_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/Bram/sim/Bram.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

