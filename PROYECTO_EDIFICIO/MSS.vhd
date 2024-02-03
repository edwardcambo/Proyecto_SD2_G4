library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MSS is
    Port(Reset, Clock: in STD_LOGIC;
			hora, start: in STD_LOGIC;
			igual_a_24: in STD_LOGIC;
			modo, enCont, resetCont: out STD_LOGIC;
			enReg1, enReg2, enReg3: out STD_LOGIC;
			estados: out std_logic_vector(2 downto 0));
end MSS;

architecture Behavioral of MSS is
    type Estado is (Ta, Taa,Ts, Tb, Tc, Td, Te,Tf,Tg);
    signal y: estado;
    	
begin
process (Reset, Clock)
	begin 
		if Reset = '0' then 
			y <= Ta;
		elsif rising_edge(clock) then
			case y is
				when Ta => 
					if start = '1' then
						y <= Ts;
					else 
						y <=Ta;
					end if;
				when Ts =>
					if start = '1' then
						y <= Ts;
					else
						y <= Tb;
					end if;
				when Tb => 
					if hora = '1' then
						y <= Tc;
					else 
						y <= Tb;
					end if;
				when Tc => 
					if igual_a_24 = '1' then
						y <= Td;
					else 
						y <= Tb;
					end if;
				when Td => y <= Te;
				when Te => y <= Ta;				
				
			end case;
		end if;
	end process;
	
	process (y)
	begin

   modo <= '0';
   enCont <= '0';
   resetCont <= '0';
   enReg1 <= '0';
   enReg2 <= '0';
   enReg3 <= '0';

    case y is
			when Ta =>
				estados <="000";
			when Taa =>
				estados <="001";
			when Tb =>
				estados <="010";
        when Tc =>
            modo <= '1';
            enCont <= '1';
				estados <="011";
        when Td =>
            enReg1 <= '1';
            enReg2 <= '1';
            enReg3 <= '1';
				resetCont <= '1';
				estados <="100";
        when Te =>
            enCont <= '1';
				estados <="101";
			when Tf=>
				estados <="110";
			when Tg=>
				estados <="111";
        when others =>
    end case;
end process;
end Behavioral;