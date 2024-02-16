library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TopModule is
	port ( 
				Button    : in STD_LOGIC;
				Reset     : in STD_LOGIC;
				Clock     : in STD_LOGIC;
				CompOut   : out STD_LOGIC;
				Direction : out STD_LOGIC
			);
end TopModule;

architecture Behavioral of TopModule is
	
	component ClockDivider
		port(
				Clock 		: in STD_LOGIC;
				Reset 		: in STD_LOGIC;
				ClockDivOut : out STD_LOGIC
			 );
	end component;

	component BistableButton
		port( 
				ButtonIn  : in STD_LOGIC;
				Clock 	 : in STD_LOGIC;
				Reset 	 : in STD_LOGIC;
				ButtonOut : out STD_LOGIC
			 );
	end component;

	component CounterA
		port(
				Clock  : in STD_LOGIC;
				Reset  : in STD_LOGIC;
				CE 	 : in STD_LOGIC;
				CoutA  : out STD_LOGIC_VECTOR(3 downto 0)
			 );
	end component;

	component CounterB
		port( 
				Clock : in STD_LOGIC;
				Reset : in STD_LOGIC;
				CoutB : out STD_LOGIC_VECTOR(3 downto 0)
			 );
	end component;

	component Comparator
		port( 
				CinA 	  : in STD_LOGIC_VECTOR(3 downto 0);
				CinB 	  : in STD_LOGIC_VECTOR(3 downto 0);
				CompOut : out STD_LOGIC
			 );
	end component;

	signal s_Clock  : STD_LOGIC; 
	signal s_Button : STD_LOGIC;
	signal s_CoutA  : STD_LOGIC_VECTOR(3 downto 0);
	signal s_CoutB  : STD_LOGIC_VECTOR(3 downto 0);

begin
	Direction <= '1';
	
	ClockDiv : ClockDivider 
		port map
			(
				Reset 		=> Reset,
				Clock       => Clock,
				ClockDivOut => s_Clock
			);

	BButton : BistableButton
		port map
			( 
				ButtonIn  => Button,
				Clock 	 => s_Clock,
				Reset 	 => Reset,
				ButtonOut => s_Button
			);

	Counter1 : CounterA
		port map
			(
				Clock => s_Clock,
				Reset => Reset,
				CE 	 => s_Button,
				CoutA => s_CoutA
			);

	Counter2 : CounterB 
		port map
			( 
				Clock => s_Clock,
				Reset => Reset,
				CoutB => s_CoutB
			);

	Comparator1 : Comparator 
		port map
			(
				CinA => s_CoutA,
				CinB => s_CoutB,
				CompOut => CompOut
			);

end Behavioral;