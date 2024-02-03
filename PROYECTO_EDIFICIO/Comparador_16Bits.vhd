library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Comparador_16Bits is
    Port ( data_a : in STD_LOGIC_VECTOR(4 downto 0);
				  data_b : in STD_LOGIC_VECTOR(4 downto 0);
           result : out STD_LOGIC);
end Comparador_16Bits;

architecture Behavioral of Comparador_16Bits is
begin
    process(data_a, data_b)
    begin
        if (data_a < data_b or data_a = data_b) then
            result <= '1';  -- Ambas entradas son iguales
        else
            result <= '0';  -- Las entradas son diferentes
        end if;
    end process;
end Behavioral;