library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
  port (
    clk: in std_logic;
    rst: in std_logic;
    en: in std_logic;
    address: in std_logic_vector(4 downto 0);
    data_in: in std_logic_vector(41 downto 0);
    data_out: out std_logic_vector(41 downto 0)
  );
end entity;

architecture beh of ram is

  type ram_type is array (0 to 31) of std_logic_vector(41 downto 0);
  
  signal RAM : ram_type;
  
begin

  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        RAM <= (others => (others => '0'));
      elsif en = '1' then 
        RAM(to_integer(unsigned(address))) <= data_in;
      end if;
    end if;
  end process;

  data_out <= RAM(to_integer(unsigned(address)));
  
end architecture;