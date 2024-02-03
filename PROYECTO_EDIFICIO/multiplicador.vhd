library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplicador is
  port (
    a : in std_logic_vector(4 downto 0);
    b : in std_logic_vector(4 downto 0);
    p : out std_logic_vector(9 downto 0)
  );
end entity;

architecture behav of multiplicador is
begin

  process(a,b)
    variable product : unsigned(9 downto 0);
  begin
    product := unsigned(a) * unsigned(b);
    p <= std_logic_vector(product);
  end process;

end architecture;
