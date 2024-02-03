library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity RELOJ1HZ is
    Port ( CLK50MHZ : in  STD_LOGIC;
           CLK1HZ : out  STD_LOGIC);
end RELOJ1HZ;

architecture Behavioral of RELOJ1HZ is
signal pulso: STD_LOGIC := '0';
signal contador: integer range 0 to 24999999 := 0;

begin
process (CLK50Mhz)
begin
if (CLK50Mhz'event and CLK50Mhz = '1') then 
if (contador = 24999999) then
                pulso <= NOT(pulso);
                contador <= 0;
            else
                contador <= contador+1;
            end if;
    end if;
  end process;
 CLK1HZ <=  pulso;

end Behavioral;