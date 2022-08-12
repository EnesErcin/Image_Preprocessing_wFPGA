library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity  Controllerr_f  is
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
           kernelpositiontag: out integer
        
         );
end Controllerr_f ;

architecture Behavioral of  Controllerr_f  is

    type controllerstate is (Idle,MemIntrface,Controller,Ready);
    signal current_cntr_state : controllerstate := Idle;
    
    -- FSM for circling the addres around the center
    type kernelposition_state is (Iniating, Topleft,Top,TopRight,Left,Self,Rigth,Bottomleft,Bottom,BottomRight,Adjust);
    signal kernel_cntr_state : kernelposition_state := Iniating;
    
--    signal Timer: integer:= 0;
    
    signal centeraddr : std_logic_vector(addr_size-1 downto 0);
    
    signal centeraddr_int:  integer:= 361;
    
    signal Timer_C :integer := 0;
    Signal Timer_A : integer:= 0;
    
begin


process(clk)
variable Timerforkerneltag: integer :=0 ;
begin
filtermod <= "00";

    -- Circles the kernel
        -- Outputs the address to Bram
        -- Waits for two clock cycles
        -- Tag is given to Mem_Intrface    
    case kernel_cntr_state is 
    
        when Iniating   =>  
                                if(start = '1') then
                                    if(rising_edge(clk)) then
                                        kernel_cntr_state <= Topleft;
                                        kernelpositiontag <= 0;
                                    end if;
                                end if;
  
                       
        when Topleft    =>                            
       
                         if(Timer_A >1 ) then
                                if(rising_edge(clk)) then  
                                        kernelpositiontag <= 0;
                                        kernel_cntr_state  <= Top;
                                 end if;
                                 
                                else
                                if(rising_edge(clk)) then
                                    Timer_A  <= Timer_A  + 1;   
                                    addrss_out <= std_logic_vector(to_unsigned(centeraddr_int-(numofx+1), addr_size));
                                end if;
                           end if;
                            
        when Top        =>
        
                        if(Timer_A  >3 ) then
                                if(rising_edge(clk)) then  
                                        kernelpositiontag <= 1;
                                        kernel_cntr_state  <= TopRight;
                                 end if;
                                 
                        else
                                if(rising_edge(clk)) then
                                    Timer_A <= Timer_A  + 1;   
                                    addrss_out <= std_logic_vector(to_unsigned(centeraddr_int-(numofx), addr_size));
                                end if;
                           end if;
                           
        
                
        when TopRight   =>
        
                        if(Timer_A >5 ) then
                                    if(rising_edge(clk)) then  
                                            kernelpositiontag <= 2;
                                            kernel_cntr_state  <= Left ;
                                     end if;
                                     
                                    else
                                    if(rising_edge(clk)) then
                                        Timer_A  <=Timer_A  + 1;   
                                        addrss_out <= std_logic_vector(to_unsigned(centeraddr_int-(numofx-1), addr_size));
                                    end if;
                           end if;
                           
        
        
     
        when Left       =>
        
                         if(Timer_A  >7 ) then
                                    if(rising_edge(clk)) then  
                                            kernelpositiontag <= 3;
                                            kernel_cntr_state  <= Self ;
                                     end if;
                                     
                                    else
                                    if(rising_edge(clk)) then
                                        Timer_A  <= Timer_A  + 1;   
                                        addrss_out <= std_logic_vector(to_unsigned(centeraddr_int-(1), addr_size));
                                    end if;
                           end if;
                           
        when Self       =>
        
                                 if(Timer_A  >9) then
                                    if(rising_edge(clk)) then  
                                            kernelpositiontag <= 4;
                                            kernel_cntr_state  <= Rigth ;
                                     end if;
                                     
                                    else
                                    if(rising_edge(clk)) then
                                        Timer_A <= Timer_A + 1;   
                                        addrss_out <= std_logic_vector(to_unsigned(centeraddr_int, addr_size));
                                    end if;
                           end if;
                           

        when Rigth      =>
                            if(Timer_A  >11) then
                                    if(rising_edge(clk)) then  
                                            kernelpositiontag <= 5;
                                            kernel_cntr_state  <= Bottomleft ;
                                     end if;
                                     
                                    else
                                    if(rising_edge(clk)) then
                                       Timer_A <=Timer_A  +1 ;   
                                        addrss_out <= std_logic_vector(to_unsigned(centeraddr_int+1, addr_size));
                                    end if;
                           end if;
                           
        when Bottomleft =>
        
                             if(Timer_A  >13) then
                                    if(rising_edge(clk)) then  
                                            kernelpositiontag <= 6;
                                            kernel_cntr_state  <= Bottom ;
                                     end if;
                                     
                                    else
                                    if(rising_edge(clk)) then
                                      Timer_A  <= Timer_A  + 1;   
                                        addrss_out <= std_logic_vector(to_unsigned(centeraddr_int+(numofx-1), addr_size));
                                    end if;
                           end if;       
        
        
      
        when Bottom     =>
        
                               if(Timer_A  >15) then
                                    if(rising_edge(clk)) then  
                                            kernelpositiontag <=7;
                                            kernel_cntr_state  <= BottomRight ;
                                     end if;
                                     
                                    else
                                    if(rising_edge(clk)) then
                                       Timer_A  <= Timer_A   + 1;   
                                        addrss_out <= std_logic_vector(to_unsigned(centeraddr_int+(numofx), addr_size));
                                    end if;
                           end if;  
                           

        when BottomRight=>
         
                               if(Timer_A >17) then
                                    if(rising_edge(clk)) then  
                                            kernelpositiontag <=8;
                                            kernel_cntr_state  <= Adjust ;
                                     end if;
                                     
                                    else
                                    if(rising_edge(clk)) then
                                        Timer_A  <= Timer_A  + 1;   
                                        addrss_out <= std_logic_vector(to_unsigned(centeraddr_int+(numofx +1), addr_size));
                                    end if;
                           end if;  
                           
                            
        when Adjust     =>
                                    -- Update the address
                                    if(centeraddr_int > numofx) and (centeraddr_int < numofx*(numofy-1)-5 ) then
                                        if(rising_edge(clk)) then
                                        centeraddr_int <= centeraddr_int + 1;                                   
                                        Timer_A   <= 0;    
                                        kernelpositiontag <= 11;
                                        kernel_cntr_state  <= Topleft ;
                                        centeraddr_int_out <=std_logic_vector(to_unsigned(centeraddr_int, addr_size )); 
                                        end if;
                                     end if;              
        when others     =>
        
    end case;
    



case current_cntr_state is

 when Idle =>   
 when MemIntrface =>
 when Controller =>
 when Ready => 
 when others =>
 
end case ;


end process;

end Behavioral;