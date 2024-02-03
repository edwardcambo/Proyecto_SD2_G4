library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BCD_to_7Seg is
    Port (
        bcd : in STD_LOGIC_VECTOR(3 downto 0);  -- Entrada BCD de 4 bits
        seg : out STD_LOGIC_VECTOR(6 downto 0)  -- Salida para el display de 7 segmentos
    );
end BCD_to_7Seg;

architecture Behavioral of BCD_to_7Seg is
    signal seg_table : STD_LOGIC_VECTOR(6 downto 0) := "0000000";

begin
    process(bcd)
    begin
        case bcd is
            when "0000" => seg_table <= "1111110";  -- 0 en binario
            when "0001" => seg_table <= "0110000";  -- 1 en binario
            when "0010" => seg_table <= "1101101";  -- 2 en binario
            when "0011" => seg_table <= "1111001";  -- 3 en binario
            when "0100" => seg_table <= "0110011";  -- 4 en binario
            when "0101" => seg_table <= "1011011";  -- 5 en binario
            when "0110" => seg_table <= "1011111";  -- 6 en binario
            when "0111" => seg_table <= "1110000";  -- 7 en binario
            when "1000" => seg_table <= "1111111";  -- 8 en binario
            when "1001" => seg_table <= "1110011";  -- 9 en binario
            when others => seg_table <= "0000001";  -- Cualquier otro valor
        end case;
    end process;

    seg <= seg_table;  -- Salida de los segmentos
end Behavioral;