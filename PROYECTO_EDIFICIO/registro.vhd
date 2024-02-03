library ieee;
use ieee.std_logic_1164.all;

entity registro is 
port (D : in std_logic_vector(9 downto 0);
		reset, clock : in std_logic;
		Q : out std_logic_vector(9 downto 0));
end registro;

architecture comportamiento of registro is 
begin 
	process (reset, clock)
	begin 
		if reset = '0' then 
			Q<="0000000000";
		elsif clock'event and clock = '1' then 
			Q<=D;
		end if;
	end process;
end comportamiento;
