library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library work;
use work.mydatatype.all;


entity  Sorter is
  Port ( 
           clk: in std_logic;
           filtermod: in std_logic_vector (1 downto 0);     
           
           MemIntrfaceReady: in std_logic;
           IMG_arr_to_sorter: in array_IMG;
           
           Img_bit: out std_logic_vector (7 downto 0);
           
           Sorter_Ready: out std_logic

         );
 end Sorter;


architecture Behavioral of Sorter is
        
        
    type sorterstate is (Idle,Sorting,SorterReady);
    signal current_sorter_state : sorterstate := Idle;
        
    
     signal Img_array_sorter: array_IMG;
        
begin

    process(clk)
    variable min_indx : integer := 0;
    
    variable hold: std_logic_vector(7 downto 0);
    
    begin
    
        case current_sorter_state is
            
            when Idle =>
                            if(MemIntrfaceReady = '1') then
                                if (rising_edge(clk)) then
                                    Img_array_sorter <=  IMG_arr_to_sorter;
                                    current_sorter_state <= Sorting;
                                    Sorter_Ready <= '0';
                                end if;
                            end if;
            
            when Sorting =>
                            if(rising_edge(clk)) then
                                  
                              --Sorting Algorithm
                                -- Num:8 depends on kernel data - 1 
                               for i in 0 to 8 loop
                                min_indx:=i;
                                    for j in i+1 to 8 loop
                                    
                                        if(Img_array_sorter(j) < Img_array_sorter(min_indx)) then
                                            min_indx:= j;
                                            
                                        end if;
                                    hold := Img_array_sorter(min_indx) ;
                                    Img_array_sorter(min_indx) <=  Img_array_sorter(i);
                                    Img_array_sorter(i) <=  hold;
                                    
                                    end loop;
                                --Sorting Algorithm Finished
                                
                                 end loop; 
                                 
                                 
                                current_sorter_state <= SorterReady;
                            end if;
                            
                            
            
            when SorterReady =>
            
                                case filtermod is
                                    when "00"   => Img_bit <= Img_array_sorter(0);
                                    when "01"   => Img_bit <= Img_array_sorter(8);
                                    when "10"   => Img_bit <= Img_array_sorter(4);
                                    when "11"   => Img_bit <= Img_array_sorter(0);
                                    when others =>
                                end case;
                                
                                if(rising_edge(clk)) then
                                    Sorter_Ready <= '1';
                                    current_sorter_state <= Idle;
                                end if;
                                
        end case;
    end process;


end Behavioral;