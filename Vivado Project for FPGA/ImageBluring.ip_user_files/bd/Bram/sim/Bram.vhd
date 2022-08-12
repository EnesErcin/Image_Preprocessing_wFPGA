--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
--Date        : Sun Jul 31 17:02:54 2022
--Host        : DESKTOP-46LQ702 running 64-bit major release  (build 9200)
--Command     : generate_target Bram.bd
--Design      : Bram
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Bram is
  port (
    Read_Bram_addr : in STD_LOGIC_VECTOR ( 16 downto 0 );
    Read_Bram_clk : in STD_LOGIC;
    Read_Bram_din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Read_Bram_dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Read_Bram_en : in STD_LOGIC;
    Read_Bram_we : in STD_LOGIC_VECTOR ( 0 to 0 );
    Write_Bram_addr : in STD_LOGIC_VECTOR ( 16 downto 0 );
    Write_Bram_clk : in STD_LOGIC;
    Write_Bram_din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Write_Bram_dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Write_Bram_en : in STD_LOGIC;
    Write_Bram_we : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of Bram : entity is "Bram,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Bram,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of Bram : entity is "Bram.hwdef";
end Bram;

architecture STRUCTURE of Bram is
  component Bram_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 16 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 7 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component Bram_blk_mem_gen_0_0;
  component Bram_blk_mem_gen_1_0 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 16 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 7 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component Bram_blk_mem_gen_1_0;
  signal BRAM_PORTA_0_1_ADDR : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal BRAM_PORTA_0_1_CLK : STD_LOGIC;
  signal BRAM_PORTA_0_1_DIN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal BRAM_PORTA_0_1_DOUT : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal BRAM_PORTA_0_1_EN : STD_LOGIC;
  signal BRAM_PORTA_0_1_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal BRAM_PORTA_1_1_ADDR : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal BRAM_PORTA_1_1_CLK : STD_LOGIC;
  signal BRAM_PORTA_1_1_DIN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal BRAM_PORTA_1_1_DOUT : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal BRAM_PORTA_1_1_EN : STD_LOGIC;
  signal BRAM_PORTA_1_1_WE : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of Read_Bram_clk : signal is "xilinx.com:interface:bram:1.0 Read_Bram CLK";
  attribute X_INTERFACE_INFO of Read_Bram_en : signal is "xilinx.com:interface:bram:1.0 Read_Bram EN";
  attribute X_INTERFACE_INFO of Write_Bram_clk : signal is "xilinx.com:interface:bram:1.0 Write_Bram CLK";
  attribute X_INTERFACE_INFO of Write_Bram_en : signal is "xilinx.com:interface:bram:1.0 Write_Bram EN";
  attribute X_INTERFACE_INFO of Read_Bram_addr : signal is "xilinx.com:interface:bram:1.0 Read_Bram ADDR";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of Read_Bram_addr : signal is "XIL_INTERFACENAME Read_Bram, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32, READ_LATENCY 1, READ_WRITE_MODE READ_ONLY";
  attribute X_INTERFACE_INFO of Read_Bram_din : signal is "xilinx.com:interface:bram:1.0 Read_Bram DIN";
  attribute X_INTERFACE_INFO of Read_Bram_dout : signal is "xilinx.com:interface:bram:1.0 Read_Bram DOUT";
  attribute X_INTERFACE_INFO of Read_Bram_we : signal is "xilinx.com:interface:bram:1.0 Read_Bram WE";
  attribute X_INTERFACE_INFO of Write_Bram_addr : signal is "xilinx.com:interface:bram:1.0 Write_Bram ADDR";
  attribute X_INTERFACE_PARAMETER of Write_Bram_addr : signal is "XIL_INTERFACENAME Write_Bram, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32, READ_LATENCY 1, READ_WRITE_MODE WRITE_ONLY";
  attribute X_INTERFACE_INFO of Write_Bram_din : signal is "xilinx.com:interface:bram:1.0 Write_Bram DIN";
  attribute X_INTERFACE_INFO of Write_Bram_dout : signal is "xilinx.com:interface:bram:1.0 Write_Bram DOUT";
  attribute X_INTERFACE_INFO of Write_Bram_we : signal is "xilinx.com:interface:bram:1.0 Write_Bram WE";
begin
  BRAM_PORTA_0_1_ADDR(16 downto 0) <= Read_Bram_addr(16 downto 0);
  BRAM_PORTA_0_1_CLK <= Read_Bram_clk;
  BRAM_PORTA_0_1_DIN(7 downto 0) <= Read_Bram_din(7 downto 0);
  BRAM_PORTA_0_1_EN <= Read_Bram_en;
  BRAM_PORTA_0_1_WE(0) <= Read_Bram_we(0);
  BRAM_PORTA_1_1_ADDR(16 downto 0) <= Write_Bram_addr(16 downto 0);
  BRAM_PORTA_1_1_CLK <= Write_Bram_clk;
  BRAM_PORTA_1_1_DIN(7 downto 0) <= Write_Bram_din(7 downto 0);
  BRAM_PORTA_1_1_EN <= Write_Bram_en;
  BRAM_PORTA_1_1_WE(0) <= Write_Bram_we(0);
  Read_Bram_dout(7 downto 0) <= BRAM_PORTA_0_1_DOUT(7 downto 0);
  Write_Bram_dout(7 downto 0) <= BRAM_PORTA_1_1_DOUT(7 downto 0);
blk_mem_gen_0: component Bram_blk_mem_gen_0_0
     port map (
      addra(16 downto 0) => BRAM_PORTA_0_1_ADDR(16 downto 0),
      clka => BRAM_PORTA_0_1_CLK,
      dina(7 downto 0) => BRAM_PORTA_0_1_DIN(7 downto 0),
      douta(7 downto 0) => BRAM_PORTA_0_1_DOUT(7 downto 0),
      ena => BRAM_PORTA_0_1_EN,
      wea(0) => BRAM_PORTA_0_1_WE(0)
    );
blk_mem_gen_1: component Bram_blk_mem_gen_1_0
     port map (
      addra(16 downto 0) => BRAM_PORTA_1_1_ADDR(16 downto 0),
      clka => BRAM_PORTA_1_1_CLK,
      dina(7 downto 0) => BRAM_PORTA_1_1_DIN(7 downto 0),
      douta(7 downto 0) => BRAM_PORTA_1_1_DOUT(7 downto 0),
      ena => BRAM_PORTA_1_1_EN,
      wea(0) => BRAM_PORTA_1_1_WE(0)
    );
end STRUCTURE;
