library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contador_up is 
	port (clock,reset,en : in std_logic;
			Q : out std_logic_vector(4 downto 0));
end contador_up;

architecture behavior of contador_up is 
	signal count: std_logic_vector (4 downto 0);
begin 
	process (clock, reset)
	begin 
		if reset ='0' then
			count<="00000";
		elsif (clock'event and clock='1') then
			if en ='1' then 
				count <= count + 1;
			else
				count <= count;
			end if;
		end if;
	end process;
	Q <= count ;
end behavior ;
	
		