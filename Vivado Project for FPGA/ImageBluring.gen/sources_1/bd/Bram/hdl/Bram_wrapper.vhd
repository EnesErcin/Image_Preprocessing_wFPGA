--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
--Date        : Sun Jul 31 17:02:54 2022
--Host        : DESKTOP-46LQ702 running 64-bit major release  (build 9200)
--Command     : generate_target Bram_wrapper.bd
--Design      : Bram_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Bram_wrapper is
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
end Bram_wrapper;

architecture STRUCTURE of Bram_wrapper is
  component Bram is
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
  end component Bram;
begin
Bram_i: component Bram
     port map (
      Read_Bram_addr(16 downto 0) => Read_Bram_addr(16 downto 0),
      Read_Bram_clk => Read_Bram_clk,
      Read_Bram_din(7 downto 0) => Read_Bram_din(7 downto 0),
      Read_Bram_dout(7 downto 0) => Read_Bram_dout(7 downto 0),
      Read_Bram_en => Read_Bram_en,
      Read_Bram_we(0) => Read_Bram_we(0),
      Write_Bram_addr(16 downto 0) => Write_Bram_addr(16 downto 0),
      Write_Bram_clk => Write_Bram_clk,
      Write_Bram_din(7 downto 0) => Write_Bram_din(7 downto 0),
      Write_Bram_dout(7 downto 0) => Write_Bram_dout(7 downto 0),
      Write_Bram_en => Write_Bram_en,
      Write_Bram_we(0) => Write_Bram_we(0)
    );
end STRUCTURE;
