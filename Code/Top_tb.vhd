library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.mydatatype.all;


entity Main_tb is
generic(
        addr_size : integer := 17;
        numofx: integer := 360;
        numofy: integer := 265
        );
port(
        clk_v: in std_logic
        );
end Main_tb;


architecture dataflow of Main_tb is


    constant ClockFrequency : integer := 1000e6; -- 100 MHz
    constant ClockPeriod    : time    := 2000 ms / ClockFrequency;

Component Bram_wrapper is
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
end Component;


Component Controllerr_f is
generic(
        addr_size : integer := 17;
        numofx: integer := 360;
        numofy: integer := 265
        );
  Port (
           clk: in std_logic;
           filtermod: out std_logic_vector (1 downto 0);
           -- 00 min    01 Max      11Median    
           start: in std_logic:= '0';
           -- To the builder (Center)
           centeraddr_int_out: out std_logic_vector(addr_size-1 downto 0);
           
           --To the Bram (Circles the central poisiton)
           addrss_out: out std_logic_vector(addr_size-1 downto 0);
           kernelpositiontag: out integer := 0
         );
end Component;



Component MemoryInterface is
  Port ( 
            clk: in std_logic;
            Img_bit :in std_logic_vector(7 downto 0);
            
            kernelpositiontag: in integer:= 0;
            
            MemIntrfaceReady: out std_logic;
            
            IMG_arr_to_sorter: out array_IMG
               
         );
end Component;



Component Sorter is
  Port ( 
           clk: in std_logic;
           filtermod: in std_logic_vector (1 downto 0);     
           
           MemIntrfaceReady: in std_logic;
           IMG_arr_to_sorter: in array_IMG;
           
           Img_bit: out std_logic_vector (7 downto 0);
           
           Sorter_Ready: out std_logic

         );
 end component;
 
 
 
component Img_Builder is
generic(
        addr_size : integer := 17;
        numofx: integer := 360;
        numofy: integer := 265
        );
  Port (
            clk: in std_logic;
            start: in std_logic;
            center_addr: in std_logic_vector(addr_size-1 downto 0);
            Img_bit: in std_logic_vector(7 downto 0);
            
            center_addr_int : in std_logic_vector(addr_size-1 downto 0);
            
            
            kernelpositiontag: in integer;
            Builder_Ready : out std_logic:='0';
            Builder_Counter: out integer:= 0  ;
            
            -- Signals to bram write
             Img_Result_to_Bram : out std_logic_vector(7 downto 0);
             Result_Addr_to_Bram: out std_logic_vector(addr_size-1 downto 0)
             );
end component;


   signal clk            :       std_logic:= '0'; 
   signal filtermod_S      :      std_logic_vector(1 downto 0):= "00"; 
   signal Sorter_Ready:         std_logic; 
   signal MemIntrfaceReady:     std_logic; 
   signal Img_bit_Result:              std_logic_vector(7 downto 0);
   signal kernelpositiontag_new:    integer := 0;
   signal IMG_arr_to_sorter:    array_IMG;
   signal Img_frombram:         std_logic_vector(7 downto 0);   
   signal start:                std_logic:= '1';
   signal addrss_out:           std_logic_vector(addr_size-1 downto 0);
          
          
    signal  Read_Bram_en :     STD_LOGIC := '1';
    signal   Write_Bram_addr: std_logic_vector(addr_size-1 downto 0);
    signal   Write_Bram_din :  std_logic_vector(7 downto 0);
    signal   Write_Bram_en :  STD_LOGIC := '1';
    signal   Write_Bram_we : STD_LOGIC_VECTOR ( 0 to 0 ):= "1";
    
    signal Write_Bram_dout:STD_LOGIC_VECTOR ( 7 downto 0 );
    
    signal Builder_Ready: std_logic:='0';
    signal Img_Result_to_Bram : std_logic_vector(7 downto 0);
    signal Result_Addr_to_Bram: std_logic_vector(addr_size-1 downto 0);
    signal Build_Counter: integer:=0;
    signal centeraddr_int_out: std_logic_vector(addr_size-1 downto 0);
    
begin

SRTR: Sorter port map(
clk             => clk,
filtermod       => filtermod_S,
                 
MemIntrfaceReady => MemIntrfaceReady,
IMG_arr_to_sorter =>IMG_arr_to_sorter,
                 
    Img_bit        => Img_bit_Result  ,
                 
Sorter_Ready       => Sorter_Ready  

);


CNTRL: Controllerr_f 
    generic map(
            addr_size  =>   addr_size,
            numofx     =>   numofx   ,
            numofy     =>   numofy   
    )
    port map(
     clk => clk,
     filtermod => filtermod_S,
    
     start  => start,
     
     centeraddr_int_out =>     centeraddr_int_out,             
     addrss_out =>  addrss_out,
     kernelpositiontag => kernelpositiontag_new
    
    );
    
MemIntrface: MemoryInterface
port map(
clk               => clk,
Img_bit           => Img_frombram ,

kernelpositiontag => kernelpositiontag_new,
                   
MemIntrfaceReady  => MemIntrfaceReady ,

IMG_arr_to_sorter => IMG_arr_to_sorter
);    
    
Bram: Bram_wrapper port map(
    Read_Bram_addr     =>       addrss_out      ,
    Read_Bram_clk      =>      clk          ,
    Read_Bram_din      =>       Write_Bram_din   ,
    Read_Bram_dout     =>      Img_frombram   ,
    Read_Bram_en       =>       Read_Bram_en ,
    Read_Bram_we       =>       "0"  ,
    Write_Bram_addr    =>     Write_Bram_addr   ,
    Write_Bram_clk     =>     clk_v          ,
    Write_Bram_din     =>     Write_Bram_din   ,
    Write_Bram_dout    =>       Write_Bram_dout   ,
    Write_Bram_en      =>      Write_Bram_en     ,
    Write_Bram_we      =>      Write_Bram_we     

);    

Builder:IMG_Builder
generic map(                                                                          
             addr_size  =>   addr_size,                                                
             numofx     =>   numofx   ,                                                 
             numofy     =>   numofy                                                    
        )                                                                        
  Port map (                                                                          
            clk            =>  clk,                     
            start              =>  start,                  
            center_addr        =>   addrss_out,         
            Img_bit            =>    Img_bit_Result,              
                                    
            center_addr_int    =>       centeraddr_int_out,   
                                     
                                     
            kernelpositiontag  =>   kernelpositiontag_new,   
            Builder_Ready        =>    Builder_Ready ,         
            Builder_Counter    =>       Build_Counter ,  
                                                                                  
            -- Signals to bram write                                              
             Img_Result_to_Bram =>       Img_Result_to_Bram ,
             Result_Addr_to_Bram=>       Result_Addr_to_Bram
             );  


Clk  <= not Clk after ClockPeriod / 2; 
process


begin

end process;

end dataflow;

