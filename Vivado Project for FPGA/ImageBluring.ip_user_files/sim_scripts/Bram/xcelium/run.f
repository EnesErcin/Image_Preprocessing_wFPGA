-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_5 \
  "../../../../ImageBluring.gen/sources_1/bd/Bram/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Bram/ip/Bram_blk_mem_gen_0_0/sim/Bram_blk_mem_gen_0_0.v" \
  "../../../bd/Bram/ip/Bram_blk_mem_gen_1_0/sim/Bram_blk_mem_gen_1_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/Bram/sim/Bram.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

