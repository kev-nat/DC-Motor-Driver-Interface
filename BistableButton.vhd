library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BistableButton is
    Port (
				ButtonIn 	: in  STD_LOGIC;
            Clock 		: in  STD_LOGIC;
            Reset 		: in  STD_LOGIC;
            ButtonOut : out  STD_LOGIC
			 );
end BistableButton;

architecture Behavioral of BistableButton is

	type btn_state is (
								st_released, st_pressed
							);

	signal state_i, next_state_i : btn_state := st_released;

begin

sync : process(Reset, Clock)

begin
	if (Reset = '0') then
		state_i <= st_released;
	elsif rising_edge(Clock) then
		state_i <= next_state_i;
	end if;
end process;

Next_st : process(state_i, ButtonIn)

begin
	case (state_i) is
		when st_released =>
			ButtonOut <= '0';
		if ButtonIn = '1' then
			next_state_i <= st_released;
		else
			next_state_i <= st_pressed;
			ButtonOut <='1';
		end if;
			
		when st_pressed => 
			ButtonOut <= '0';
		if ButtonIn = '0' then
			next_state_i <= st_pressed;
		else 
			next_state_i <= st_released;
		end if;
	end case;
	
end process;

end Behavioral;