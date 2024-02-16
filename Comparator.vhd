library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Comparator is
    Port (
				CinA 	  : in  STD_LOGIC_VECTOR(3 downto 0);
            CinB 	  : in  STD_LOGIC_VECTOR(3 downto 0);
            CompOut : out  STD_LOGIC
			);
end Comparator;

architecture Behavioral of Comparator is

begin
	process (CinA,CinB)
		begin
			if (CinA > CinB) then
				CompOut <= '1';
			else 
				CompOut <= '0';
		end if;
	end process;
end Behavioral;