library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CounterA is
    Port (
				Clock	: in STD_LOGIC; -- Clock Input
            Reset	: in STD_LOGIC; -- Reset Input
			   CE		: in STD_LOGIC; -- Clock Enabler
            CoutA	: out STD_LOGIC_VECTOR(3 downto 0) -- Clock Enabler
			);
end CounterA;

architecture Behavioral of CounterA is
	signal s_CounterA : STD_LOGIC_VECTOR(3 downto 0);
	
begin -- Up counter
	process(Clock, Reset) is
		begin
			if (Reset = '0') then
				s_CounterA <= "0000";
					else
					  if(rising_edge(Clock)) then
					if(CE='1') then
				s_CounterA <= s_CounterA + "1";
			end if;
		end if;
	end if;
end process;

CoutA <= s_CounterA;

end Behavioral;