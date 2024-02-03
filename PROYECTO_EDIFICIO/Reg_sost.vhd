library ieee;
use ieee.std_logic_1164.all;

entity Reg_sost is
  port (
		Resetn     : in  std_logic;
		Clock       : in  std_logic;
		en_registro : in  std_logic;
    Din         : in  std_logic_vector(9 downto 0); 
    Qout        : out std_logic_vector(9 downto 0)
  );
end Reg_sost;

architecture desarrollo of Reg_sost is
  signal temp : std_logic_vector(9 downto 0);
begin
  process (Clock, en_registro)
  begin
    if Resetn = '0' then
      temp <= (others => '0');
    elsif rising_edge(Clock) then
      if en_registro = '1' then
        temp <= Din;
      else
        temp <= temp;
      end if;
    end if;
  end process;

  Qout <= temp;
end desarrollo;
