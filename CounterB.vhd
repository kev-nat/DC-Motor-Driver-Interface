library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CounterB is
    Port (
				Clock : in STD_LOGIC; -- Clock Input
				Reset : in STD_LOGIC; -- Reset Input
				CoutB : out STD_LOGIC_VECTOR(3 downto 0) -- Output 4-bit Counter
			);
end CounterB;

architecture Behavioral of CounterB is
	signal s_CounterB: STD_LOGIC_VECTOR(3 downto 0);

begin -- Up Counter
	process(Clock, Reset) is
		begin
			if (Reset = '0') then
				s_CounterB <= "0000";
					elsif(rising_edge(Clock)) then
						if(s_CounterB="1111") then
					s_CounterB <= "0000";
				else
			s_CounterB <= s_CounterB + "1";
		end if;
	end if;
end process;

CoutB <= s_CounterB;

end Behavioral;