library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity concatenacion is
port (piso1, piso2, piso3: in std_logic_vector (3 downto 0);
		Cpiso1, Cpiso2, Cpiso3: in std_logic_vector (9 downto 0);
		historico: out std_logic_vector (41 downto 0));
end concatenacion;

architecture solucion of concatenacion is
begin
	historico <= piso1 & Cpiso1 & piso2 & Cpiso2 & piso3 & Cpiso3;
end solucion;
		