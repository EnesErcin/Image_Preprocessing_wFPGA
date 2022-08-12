library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Img_Builder is
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
            
            center_addr_int :in std_logic_vector(addr_size-1 downto 0);
            
            
            kernelpositiontag: in integer;
            Builder_Ready : out std_logic:='0';
            Builder_Counter: out integer:= 0  ;
            
            -- Signals to bram write
             Img_Result_to_Bram : out std_logic_vector(7 downto 0);
             Result_Addr_to_Bram: out std_logic_vector(addr_size-1 downto 0)
             );
end Img_Builder;

architecture Behavioral of Img_Builder is

signal timer_builder: integer := 0;
    
    -- FSM for Builder
    type builderstate is (Idle,StoretheAddr,WaitingForSorter,BuilderReady);
    signal current_builder_state : builderstate := Idle;
    
    signal center_addr_hold_b: std_logic_vector(addr_size-1 downto 0);
    signal kernel_poisiton_tag_b: integer:=0;
    
    signal Img_Result_Holder: std_logic_vector(7 downto 0);
    signal Build_Counter_internal: integer:= 0;
    

begin


process(clk)
begin

     kernel_poisiton_tag_b <=kernelpositiontag;
      Builder_Counter <= Build_Counter_internal;                   
      
      
    case current_builder_state is
    
        when Idle =>
                        if(start = '1') then
                            if(rising_edge(clk)) then
                                current_builder_state <= StoretheAddr;
                            end if;
                        end if;
                        
        when StoretheAddr =>        
                                if( kernelpositiontag = 11) then  
                                    if(rising_edge(clk)) then
                                         Builder_Ready  <= '0';
           
                                        center_addr_hold_b <= center_addr_int;
                                        current_builder_state <= WaitingForSorter;
                                    end if;
                                end if;          
                                
        when WaitingForSorter =>
                                    if( kernelpositiontag = 0) then
                                      
                                        if(timer_builder > 0) then
                                            if(rising_edge(clk)) then
                                                Img_Result_Holder <=Img_bit;
                                                current_builder_state <= BuilderReady;
                                             end if;
                                        end if;
                                        
                                        
                                        if(rising_edge(clk)) then
                                            timer_builder <= timer_builder +1;
                                        end if;
                                        
                                    
                                    end if;
                    
        when BuilderReady =>
                                if(rising_edge(clk)) then
                                    timer_builder <= 0;   
                                    Img_Result_to_Bram <= Img_Result_Holder;
                                     Builder_Ready  <= '1';
                               
                                    Result_Addr_to_Bram <=center_addr_hold_b;
                                    current_builder_state <= StoretheAddr;
                                    Build_Counter_internal <= Build_Counter_internal + 1;
                                end if;
        when others =>
    
    end case;

end process;

end Behavioral;
