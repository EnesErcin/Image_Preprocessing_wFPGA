library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package pkg is
    -- 8 = KernelSize - 1 !! Adjust it for different filters
  type array_IMG is array (0 to 8) of std_logic_vector(7 downto 0);
end package;


