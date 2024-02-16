library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ClockDivider is
    Port (
				Clock 	   : in  STD_LOGIC;
            Reset		   : in  STD_LOGIC;
            ClockDivOut : out  STD_LOGIC
			);
end ClockDivider;

architecture Behavioral of ClockDivider is

	signal s_Counter : integer;
	signal tmp : STD_LOGIC;

begin

process(Clock, Reset)
	begin
		if(Reset = '0') then
			s_Counter <= 1;
			tmp <= '0';
		elsif(Clock'event and Clock ='1') then
			s_Counter <= s_Counter + 1;
		if (s_Counter = 2000) then 
			tmp <= NOT tmp;
		elsif(s_Counter = 4000) then
			tmp <= NOT tmp;
			s_Counter <= 1;
		end if;
	end if;

ClockDivOut <= tmp;
 
end process;

end Behavioral;