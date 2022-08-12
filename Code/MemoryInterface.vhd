library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.mydatatype.all;


entity MemoryInterface is
  Port ( 
            clk: in std_logic;
            Img_bit :in std_logic_vector(7 downto 0);
            
            kernelpositiontag: in integer;
            
            MemIntrfaceReady: out std_logic;
            
            IMG_arr_to_sorter: out array_IMG
               
         );
end MemoryInterface;

architecture Behavioral of MemoryInterface is
        
        signal Img_array_intrface: array_IMG;
               
        
begin

process(clk)
begin

case kernelpositiontag is

    when 0 => 
                 if(rising_edge(clk)) then
                    Img_array_intrface(0) <=  Img_bit;
                     MemIntrfaceReady <= '0';
                 end if;
    
    when 1 =>
                if(rising_edge(clk)) then
                    Img_array_intrface(1) <=  Img_bit;
                 end if;
    when 2 =>
                if(rising_edge(clk)) then
                    Img_array_intrface(2) <=  Img_bit;
                 end if;
    when 3 =>
                if(rising_edge(clk)) then
                    Img_array_intrface(3) <=  Img_bit;
                 end if;
    when 4 =>
                if(rising_edge(clk)) then
                    Img_array_intrface(4) <=  Img_bit;
                 end if;
    when 5 =>
                if(rising_edge(clk)) then
                    Img_array_intrface(5) <=  Img_bit;
                 end if;
    when 6 =>
                if(rising_edge(clk)) then
                    Img_array_intrface(6) <=  Img_bit;
                 end if;
    when 7 =>
                if(rising_edge(clk)) then
                    Img_array_intrface(7) <=  Img_bit;
                 end if;
    when 8 =>
                if(rising_edge(clk)) then
                    Img_array_intrface(8) <=  Img_bit;
                 end if;
    
    when 11 =>      if(rising_edge(clk)) then
                        MemIntrfaceReady <= '1';
                       IMG_arr_to_sorter <= Img_array_intrface ;
                    end if;
    
    when others =>

end case;

end process;



end Behavioral;
